module LoginsHelper
  def current_user
    Author.find_by_id(session[:user_id]) ||
    User.find_by_id(session[:user_id])
  end
end
