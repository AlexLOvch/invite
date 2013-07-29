class User < ActiveRecord::Base
   attr_accessible :email, :encrypted_password, :salt, :name, :phone, :addr, :password, :password_confirmation
   attr_accessor :password, :password_confirmation

   before_save :encrypt_password  
   
   validates_confirmation_of :password  
   validates_presence_of :password, :on => :create  
   validates_presence_of :email  
   validates_uniqueness_of :email


   def empty_phone?
      phone.blank?
   end  

   def self.authenticate(email, password)  
        user = find_by_email(email)  
        if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.salt)  
          user  
        else  
          nil  
        end  
   end  


   private

   def encrypt_password  
    if password.present?  
      self.salt = BCrypt::Engine.generate_salt  
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)  
    end  
   end  

end
