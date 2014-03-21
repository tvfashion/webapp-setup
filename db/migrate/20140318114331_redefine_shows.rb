class RedefineShows < ActiveRecord::Migration
  def change
    drop_table :shows

    create_table :shows do |t|
      t.integer  :series_id
      t.string   :name
      t.text     :overview
      t.string   :first_aired
      t.string   :genres
      t.string   :network
      t.integer  :rating
      t.string   :runtime
      t.string   :air_time
      t.integer  :imdb_id
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