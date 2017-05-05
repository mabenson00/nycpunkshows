json.extract! concert, :id, :date, :time, :venue, :bands, :created_at, :updated_at
json.url concert_url(concert, format: :json)
