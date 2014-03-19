json.array!(@actors) do |character|
  json.extract! character, :id, :image, :name, :role, :show_id, :episode_id
  json.url character_url(character, format: :json)
end
