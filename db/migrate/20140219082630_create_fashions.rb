class CreateFashions < ActiveRecord::Migration
  def change
    create_table :fashions do |t|
      t.string :name
      t.boolean :match
      t.string :charPic
      t.string :productPic
      t.string :productLink
      t.belongs_to :episode
      t.belongs_to :actor

      t.timestamps
    end
  end
end
