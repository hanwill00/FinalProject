class Itinerary < ApplicationRecord
  has_many :events, inverse_of: :itinerary
  accepts_nested_attributes_for :events, reject_if: :all_blank
  belongs_to :user
  validates :name, presence: true
end
