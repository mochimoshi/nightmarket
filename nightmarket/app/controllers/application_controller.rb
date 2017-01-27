class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :authorized_user

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_user
  	user = current_user
  	@authorized_user ||= AuthorizedStudent.find_by email: user.email
  end
end
