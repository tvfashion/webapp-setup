class RedefineBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string      :banner_type
      t.string      :banner_type2
      t.string      :season
      t.string      :path
      t.string      :language
      t.integer     :series_id

      t.timestamps
    end
  end
end
