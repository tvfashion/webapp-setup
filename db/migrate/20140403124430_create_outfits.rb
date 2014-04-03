class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.belongs_to :episode, index: true
      t.belongs_to :actor, index: true
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
