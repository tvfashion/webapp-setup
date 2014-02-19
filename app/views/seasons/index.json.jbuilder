json.array!(@seasons) do |season|
  json.extract! season, :id, :name, :image, :show_id
  json.url season_url(season, format: :json)
end
