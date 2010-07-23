class SwordEngineCreateSitePageMaps < ActiveRecord::Migration
  def self.up
    create_table :site_page_maps do |t|
      t.integer :site_id
      t.integer :page_id

      t.timestamps
    end

  end

  def self.down
    drop_table :site_page_maps
  end
end
