class Invitation < ActiveRecord::Base
  attr_accessible :email
  before_save :generate_link
  validates_presence_of :email  

  def self.active?(link)
    invite = where(link: link).present?
    invite && User.where(email: invite.email).empty? 
  end  

  def self.already_registered?(link)
    invite = where(link: link).present?
    invite && User.where(email: invite.email).present? 
  end  


  private

  def generate_link
    letters =  [('0'..'9'),('a'..'f')].map{|i| i.to_a}.flatten
    self.link=(0...128).map{ letters[rand(letters.length)] }.join
  end  

end