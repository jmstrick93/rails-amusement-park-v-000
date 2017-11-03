class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:sign_in, :create]

  def sign_in
    #
    @user = User.new
    #
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        add_flash_error("Invalid Password")
        redirect_to signin_path
      end
    else
      add_flash_error("Invalid Username")
      redirect_to signin_path
    end
  end

  def logout
    session.delete(:user_id)
    flash[:notice] = "Successfully signed out"
    redirect_to root_path
  end


  private

  def session_params
    params.require(:user).permit(:name, :password)
  end


end
