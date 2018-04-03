json.extract! event, :id, :itinerary_id, :location, :journal_entry, :time_start, :time_end, :created_at, :updated_at
json.url event_url(event, format: :json)
