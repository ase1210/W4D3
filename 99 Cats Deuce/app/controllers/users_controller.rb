class UsersController < ApplicationController

  def new
    @user = User.new
    render :new 
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else 
      flash[:error] = ["Dumas, try again."]
      redirect_to new_user_url
    end
  end

  private
  def user_params
    params.require(:users).permit(:username, :password)
  end

end
