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

	def login_complete
		u = User.where(username: params[:username])[0]
		if u.nil?
			flash[:alert] = "Incorrect username or password."
			redirect_to :back
		else
			if u.password != params[:password]
				flash[:alert] = "Incorrect username or password."
				redirect_to :back
			else
				cookies[:user_id] = u.id
				flash[:alert] = "Successfully logged in."
				redirect_to "/wall/posts"
			end
		end
	end
end
