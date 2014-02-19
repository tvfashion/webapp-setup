json.array!(@shows) do |show|
  json.extract! show, :id, :name, :banner, :overview, :network, :airsDayOfWeek, :airsTime, :genres, :rating, :runtime, :status, :fanart, :poster
  json.url show_url(show, format: :json)
end
