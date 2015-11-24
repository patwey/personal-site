class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    unless current_admin?
      flash[:error] = 'Please Log In'
      redirect_to login_path
    end
  end
end

