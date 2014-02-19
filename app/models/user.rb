class User < ActiveRecord::Base
	validates :username, :presence => { :message => "Username cannot be blank." }
	validates :username, :uniqueness => { :message => "Username is already taken.", :case_sensitive => false }
	validates :password, :length => { :minimum => 6, :too_short => "Your password must be at least 6 characters long." }
end
