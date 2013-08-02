class UsersController < ApplicationController
 prepend_before_filter  :authorize_user!, :except=>[:new,:create]



  def new  
    if current_user
      redirect_to root_url, :flash => { :notice => "You are already registered and loged in."}
    elsif params.has_key?(:link) && Invitation.active?(params[:link])
      @user = User.new  
      @user.email=Invitation.find_by_link(params[:link]).email
    else  
      redirect_to log_in_url, :flash => Invitation.already_registered?(params[:link]) ? { :notice => "You are already registered! Please log in."} : { :error =>  "Signup possible only by invitation!" } 
    end  
  end  
    
  def create  
    link=params[:user].delete(:link)
    @user = User.new(params[:user]) 
    @user.email=Invitation.where(link: link).first.try(:email)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_url, :notice => "Signed up! Please fill in your personal details, or go to our #{self.class.helpers.link_to('homepage',root_path)}!"  
    else  
      render "new"  
    end  
  end


  def profile
    @user = current_user
    render action: 'edit'
  end
  

  def update_profile
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to  profile_path, :notice  => "Successfully updated profile."
    else
      render :action => 'edit',:notice  => @user.errors.inspect
    end
  end


protected
  
  

end