class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :number
      t.string :name
      t.text :overview
      t.string :thumbnail
      t.integer :season_id
      t.integer :show_id

      t.timestamps
    end
  end
end
