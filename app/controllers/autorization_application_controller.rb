class AutorizationController < ApplicationController
	before_filter :autorize_user!


	protected
	
		def  autorize_user!
			return	if session[:user_id]
			redirect_to log_in_path
		end
end