class CreateItineraryFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :itinerary_followings do |t|
      t.references :itinerary, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
