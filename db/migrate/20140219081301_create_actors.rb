class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.integer  :actor_id
      t.string   :name
      t.string   :role
      t.string   :image
      t.integer  :series_id
      t.string   :sort_order

      t.timestamps
    end
  end
end
