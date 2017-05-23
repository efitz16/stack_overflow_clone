module SessionsHelper
  def log_in(user_id)
  	session[:user_id] = user_id
  end

  def logged_in?
  	!current_user.nil?
  end

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def log_out
    session[:user_id] = nil
  end
end
