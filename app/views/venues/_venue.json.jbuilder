json.extract! venue, :id, :name, :concerts, :created_at, :updated_at
json.url venue_url(venue, format: :json)
