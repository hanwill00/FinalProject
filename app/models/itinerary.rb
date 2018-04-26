class Itinerary < ApplicationRecord
  has_many :events, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
end
