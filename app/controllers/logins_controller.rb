class LoginsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash.notice = "You have been logged out!"
    redirect_to '/'
  end
end
