class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def index
    @attractions = Attraction.all
    @user = User.find_by(:id => session[:user_id])
  end

  def show
    @user = User.find_by(:id => session[:user_id])
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
  end

  def edit
    @attraction = Attraction.find_by(params[:id])
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

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

  def flash_message(text)
    flash[:notice] = text
  end

end
