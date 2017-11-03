class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
  end

  def ride
    @user = User.find_by(:id => session[:user_id])
    @attraction = Attraction.find_by(:id => params[:id])
    @ride = Ride.new do |r|
      r.user_id = session[:user_id]
      r.attraction_id = params[:id]
    end
    flash_text = @ride.take_ride
    flash_message(flash_text)
    redirect_to user_path(@user)
  end

  private

  def flash_message(text)
    flash[:notice] = text
  end

end
