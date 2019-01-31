class SessionsController < ApplicationController

  def new
    render :new      #Need to create view
  end

  def create
    user = User.find_by_credentials(params[:users][:username],params[:users][:password])
    if user
      user.reset_session_token!
      session[:session_token] = user.reset_session_token!
      redirect_to user_url(user)
    else 
      flash.now[:error] = ["Invalid Login Credentials"]
      render :new 
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
