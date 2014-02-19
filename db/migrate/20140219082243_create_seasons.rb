class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name
      t.string :image
      t.integer :show_id

      t.timestamps
    end
  end
end
