class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login


  private

  def require_login
    unless logged_in?
      flash[:error] ||= []
      flash[:error] << "You must be logged in to access this section"
      redirect_to root_path    # halts request cycle
    end
  end

  def logged_in?
    session[:user_id].present? && User.find_by(id: session[:user_id]) ? true : false
  end

  def add_flash_error(error_text)
    flash[:error] ||= []
    flash[:error] << error_text
  end

end
