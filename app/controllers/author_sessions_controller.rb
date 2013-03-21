class AuthorSessionsController < ApplicationController
  before_filter :require_login, except: [ :new, :create, :destroy ]

  def new
  end

  def create
    if login(params[:username], params[:password])
      redirect_back_or_to articles_path, message: 'Logged in successfully.'
    else
      flash[:message] = "Login failed."
      render :new
    end
  end

  def destroy
    logout
    flash[:message] = 'Logged out!'
    redirect_to articles_path
  end
end
