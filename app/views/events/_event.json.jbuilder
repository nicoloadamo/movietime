json.extract! event, :id, :name, :description, :language, :max_registrations, :address, :latitude, :longitude, :start_time, :end_time, :movie_id, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
