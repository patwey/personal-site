class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def valid_login?
    @user && @user.authenticate(params[:session][:password])
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
