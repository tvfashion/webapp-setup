json.array!(@actors) do |actor|
  json.extract! actor, :id, :image, :name, :role, :series_id
  json.url actor_url(actor, format: :json)
end
