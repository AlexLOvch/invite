class HomeController < ApplicationController
	before_filter :autorize_user!

	def index
	end	
end
