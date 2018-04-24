class AddNameToItinerary < ActiveRecord::Migration[5.1]
  def change
    add_column :itineraries, :name, :string
  end
end
