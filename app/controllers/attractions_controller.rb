class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
  end

  def ride
    @user = User.find_by(:id => session[:user_id])
    @ride = Ride.new do |r|
      r.user_id = session[:user_id]
      r.attraction_id = params[:id]
    end
    @ride.save

    redirect_to user_path(@user)
  end

end
