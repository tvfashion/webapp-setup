class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :banner
      t.text :overview
      t.string :network
      t.string :airsDayOfWeek
      t.string :airsTime
      t.string :genres
      t.string :rating
      t.integer :runtime
      t.string :status
      t.string :fanart
      t.string :poster

      t.timestamps
    end
  end
end
