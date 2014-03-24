class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string   :name
      t.text     :overview
      t.string   :first_aired
      t.string   :genres
      t.string   :network
      t.integer  :rating
      t.string   :runtime
      t.string   :air_time
      t.string 	 :imdb_id
      t.integer  :episodes_count
      t.integer  :actors_count
      t.integer  :seasons_count
      t.string   :status
      t.string   :airs_dayofweek
      t.integer  :rating_count

      t.timestamps
    end
  end
end
