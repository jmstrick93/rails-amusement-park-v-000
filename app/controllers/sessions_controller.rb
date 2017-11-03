class SessionsController < ApplicationController

  def sign_in
    # binding.pry
    @user = User.new
    # binding.pry
  end

  def create
    @user = User.find_by(params[:user][:id])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash = @user.try(:errors)
      redirect_to signin_path
    end
  end


  private

  def session_params
    params.require(:user).permit(:name, :password)
  end

end
