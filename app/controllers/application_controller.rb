class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in, :current_admin?, :authorize_admin

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def logged_in
    redirect_to books_path unless current_user
  end

  def authorize_admin
    redirect_to books_path unless current_admin?
  end
end
