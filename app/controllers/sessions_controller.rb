class SessionsController < ApplicationController
  before_action :skip_if_logged_in, only: [:new]

  def new
  end

  def create
    if @user = User.find_by_email(params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Logged In!"
        redirect_to users_path
      else
        flash.now[:error] = "Password is incorrect!"
        redirect_to new_session_path
      end
    else
      flash.now[:error] = "Password is incorrect!"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
