class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :signed_in?

  def signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def require_login
    if !signed_in?
      flash[:notice] = "Please login!"
      redirect_to root_path
    end
  end

  def skip_if_logged_in
    if signed_in?
      redirect_to users_path
    end
  end
end
