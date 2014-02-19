json.array!(@episodes) do |episode|
  json.extract! episode, :id, :number, :name, :overview, :thumbnail, :season_id, :show_id
  json.url episode_url(episode, format: :json)
end
