class SessionsController < ApplicationController
	def new
  end

  def create
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to authentications_url,
  	notice: "You've been logged out."
  end
end
