class UsersController < ApplicationController
 prepend_before_filter	:autorize_user!, :except=>[:new,:create]
 before_filter :get_user, :only=>[:profile,:update_profile]


  def new  
    @user = User.new  
  end  
    
  def create  
    @user = User.new(params[:user])  
    if @user.save  
      redirect_to root_url, :notice => "Signed up!"  
    else  
      render "new"  
    end  
  end


  def profile
    @user = User.find(current_user.id)
    render action: 'edit'
  end
  

  def update_profile
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      redirect_to  profile_path, :notice  => "Successfully updated user."
    else
      render :action => 'edit',:notice  => @user.errors.inspect
    end
  end


protected
	
	def get_user
		@user = User.find(current_user.id)
	end	


end