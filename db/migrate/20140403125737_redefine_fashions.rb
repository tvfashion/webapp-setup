class RedefineFashions < ActiveRecord::Migration
  def change
      
    drop_table :fashions
      
    create_table :fashions do |t|
      t.boolean :match
      t.string :ad_image
      t.string :ad_url
      t.belongs_to :outfit

      t.timestamps
    end
  end
end
