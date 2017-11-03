class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:sign_in, :create]

  def sign_in
    #
    @user = User.new
    #
  end

  def create
    authenticate_user(@user)
  end


  private

  def session_params
    params.require(:user).permit(:name, :password)
  end

  def authenticate_user(user)
    user = User.find_by(params[:user][:id])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:errors] ||= []
      flash[:errors]= user.errors if !!user.errors
      redirect_to signin_path
    end
  end
end
