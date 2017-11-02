class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to new_user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets)
  end

end
