class UsersController < ApplicationController

	def index
	end

	def new
		@user = User.new
	end

	def create
		User.create(params[:user]
			.permit(:email, :password, :password_confirmation))
		redirect_to action:"new"
	end

	def show
		@User = User.find(params[:id])
	end

	def destroy
	end

end