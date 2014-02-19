class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	# protect_from_forgery with: :exception
	
	def login_check
		@current_user = nil
		if !cookies[:user_id].nil?
			@current_user = User.find(cookies[:user_id])
		else
			redirect_to "/user/login"
		end
	end
end
