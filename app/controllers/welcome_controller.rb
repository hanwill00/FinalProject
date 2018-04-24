class WelcomeController < ApplicationController
  def index
    @itinerary = Itinerary.new
    return unless logged_in?
    @itineraries = Itinerary.where(user: current_user).order(created_at: :desc)
  end
end
