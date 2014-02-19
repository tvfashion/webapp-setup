class CreateFashions < ActiveRecord::Migration
  def change
    create_table :fashions do |t|
      t.string :name
      t.boolean :match
      t.string :charPic
      t.string :productPic
      t.string :productLink
      t.integer :episode_id
      t.integer :show_id
      t.integer :season_id
      t.integer :character_id

      t.timestamps
    end
  end
end
