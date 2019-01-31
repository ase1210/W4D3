class SessionsController < ApplicationController

  def new
    render :new      #Need to create view
  end

  def create
    user = User.find_by_credentials(params[:users][:username],params[:users][:password])
    if user
      user.reset_session_token!
      login!   #To do
      redirect_to user_url(user)
    else 
      flash.now[:error] = ["Invalid Login Credentials"]
      render :new 
    end
  end

  def destroy
  end

end
