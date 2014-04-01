class AddIndexToActors < ActiveRecord::Migration
  def change
    add_index :actors, :actor_id
  end
end
