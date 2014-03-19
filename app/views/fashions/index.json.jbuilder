json.array!(@fashions) do |fashion|
  json.extract! fashion, :id, :name, :match, :charPic, :productPic, :productLink, :episode_id, :show_id, :season_id, :actor_id
  json.url fashion_url(fashion, format: :json)
end
