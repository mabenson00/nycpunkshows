# json.extract! band, :id, :name, :concerts, :created_at, :updated_at
# json.url band_url(band, format: :json)

# json.(@band, :id, :name, :concerts, :created_at, :updated_at)
# json.(band, :id, :name, :concerts, :created_at, :updated_at)
# # json.concerts @concerts
json.id band.id
json.name band.name
json.concerts band.concerts, :venue, :date, :time, :bands
