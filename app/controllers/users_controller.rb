class UsersController < ApplicationController

	def index
	end

	def new
		@user = User.new

	end

	def create
		User.create(params[:user]
			.permit(:name, :email, :password, :password_confirmation))

		user = User.find_by(email: params[:user][:email])
		if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user
    end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
	end

end