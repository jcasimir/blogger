class LoginsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.password_matches?(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash.notice = "login failed, please try again"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash.notice = "You have been logged out!"
    redirect_to '/'
  end
end
