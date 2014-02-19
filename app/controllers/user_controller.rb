class UserController < ApplicationController
  def signup
  end
	
	def signup_complete
		u = User.new
		u.username = params[:username]
		if params[:password] == params[:retype_password]
			u.password = params[:password]
			if u.save
				flash[:alert] = "Successfully signed up."
				redirect_to "/wall/posts"
			else
				flash[:alert] = u.errors.values.flatten.join(' ')
				redirect_to :back
			end
		else
			flash[:alert] - "Password doesn't match."
			redirect_to :back
		end
	end

	def login
	end
end
