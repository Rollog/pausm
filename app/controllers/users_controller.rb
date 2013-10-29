class UsersController < ApplicationController

	def index
	end

	def new
		@user = User.new

	end

	def create
		@user = User.new
		User.create(params[:user]
			.permit(:name, :email, :password, :password_confirmation))

		redirect_to users_id
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
	end

end