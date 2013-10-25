class SessionsController < ApplicationController
	def new
		# are they already logged in?
		if current_user # if they are logged in, can't create a new one
			redirect_to users_url
		else
			@user = User.new
			# render :new
		end
  end

  def create
  	user = User.find_by(email: params[:user][:email])
    if user
        # authenticate user
        if user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to users_url
        else
          flash.now.alert = "Unable to sign you in. Please try again."
          render :new
        end
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to authentications_url,
  	notice: "You've been logged out."
  end
end
