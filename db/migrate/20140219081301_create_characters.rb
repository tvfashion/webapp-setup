class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :image
      t.string :name
      t.string :role
      t.integer :show_id
      t.integer :episode_id

      t.timestamps
    end
  end
end