class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string   :name
      t.string   :role
      t.string   :image
      t.belongs_to  :show
      t.string   :sort_order

      t.timestamps
    end
  end
end
