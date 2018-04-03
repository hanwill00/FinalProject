class ItineraryFollowing < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user
  validates :itinerary, uniqueness: { scope: :user }
end
