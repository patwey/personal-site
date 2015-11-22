class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if valid_login?
      session[:user_id] = @user.id
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = 'Invalid Login'
      render :new
    end
  end
end
