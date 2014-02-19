class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :image
      t.string :name
      t.string :role
      t.string :show_id
      t.string :episode_id

      t.timestamps
    end
  end
end
