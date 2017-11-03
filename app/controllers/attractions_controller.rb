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
    @attraction = Attraction.find_by(:id => params[:id])
    @ride = Ride.new do |r|
      r.user_id = session[:user_id]
      r.attraction_id = params[:id]
    end
    if @ride.save
      thank_you_message(@attraction)
      @user.go_on_attraction(@attraction)
      redirect_to user_path(@user)
    else
      redirect_to attraction_path(@attraction)
    end
  end

  private

  def thank_you_message(attraction)
    flash[:notice] ||= []
    flash[:notice] << "Thanks for riding the #{attraction.name}!"
  end

end
