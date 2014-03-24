class RedefineBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string      :banner_type
      t.string      :banner_type2
      t.string      :season
      t.string      :image_path
      t.string      :language
	  t.belongs_to	:show
        
      t.timestamps
    end
  end
end
