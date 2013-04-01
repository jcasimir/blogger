class LoginsController < ApplicationController
  def new

  end

  def create
    user = User.first
    if user && user.password == params[:password]
      redirect_to '/'
    else
      redirect_to login_path
    end
  end
end
