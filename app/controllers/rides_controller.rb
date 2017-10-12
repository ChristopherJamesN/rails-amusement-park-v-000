class RidesController < ApplicationController
  def take_ride
    @ride = Ride.new(attraction_id: params[:id], user_id: session[:user_id])
    if @ride.take_ride == true
      flash[:notice] = "Thanks for riding the #{Attraction.find(params[:id]).name}!"
    else
      flash[:notice] = @ride.take_ride
    end
    redirect_to "/users/#{session[:user_id]}"
  end
end
