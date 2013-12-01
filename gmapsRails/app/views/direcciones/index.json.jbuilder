json.array!(@direcciones) do |direccione|
  json.extract! direccione, :address, :longitude, :latitude, :gmaps
  json.url direccione_url(direccione, format: :json)
end
