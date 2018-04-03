class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :itinerary, foreign_key: true
      t.string :location
      t.text :journal_entry
      t.datetime :time_start
      t.datetime :time_end

      t.timestamps
    end
  end
end
