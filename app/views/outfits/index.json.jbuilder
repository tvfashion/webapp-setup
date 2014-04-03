json.array!(@outfits) do |outfit|
  json.extract! outfit, :id, :episode_id, :actor_id, :name, :image
  json.url outfit_url(outfit, format: :json)
end
