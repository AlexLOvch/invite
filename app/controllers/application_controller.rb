class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :user_signed_in?
   
  
protected

     def current_user
       return nil unless session.has_key?(:user_id)
       User.where(id: session[:user_id]).first
     end  

     def user_signed_in?
       return !current_user.blank?
     end  


  def  authorize_user!
      return  if session[:user_id]
      redirect_to log_in_path
  end

end
