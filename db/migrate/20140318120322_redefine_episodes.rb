class RedefineEpisodes < ActiveRecord::Migration
  def change
    drop_table :episodes

    create_table :episodes do |t|
      t.integer  :episode_id
      t.integer  :season_number
      t.integer  :number
      t.string   :name
      t.text     :overview
      t.text     :thumb
      t.string   :air_date
      t.integer  :guest_stars
      t.string   :director
      t.string   :writer
      t.integer  :series_id
      t.integer  :season_id
      t.integer  :rating
      t.integer  :rating_count

      t.timestamps
    end
  end
end
