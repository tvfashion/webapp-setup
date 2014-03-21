# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "seeding sample objects..."

show = Show.create(name: "show1", overview: "lorem ipsum...")
season = Season.create(name: "season1", series_id: series.id)
episode = Episode.create(number: 1, name: "episode1", overview: "lorem ipsum...", season_id: season.id, series_id: series.id)
actor = Actor.create(name: "actor1", series_id: series.id, episode_id: episode.id)
fashion = Fashion.create(name: "fashion1", actor_id: actor.id, season_id: season.id, series_id: series.id, episode_id: episode.id)

puts 'ROLES'
["admin", "middleuser1", "middleuser2", "basicuser"].each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end

user = User.create(email: "admin@example.com", password: "admin123", password_confirmation: "admin123")
user.save
user.add_role "admin"


puts "Done!"