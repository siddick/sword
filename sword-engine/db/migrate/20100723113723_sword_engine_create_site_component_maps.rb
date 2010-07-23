class SwordEngineCreateSiteComponentMaps < ActiveRecord::Migration
  def self.up
    create_table :site_component_maps do |t|
      t.integer :site_id
      t.integer :component_id

      t.timestamps
    end

  end

  def self.down
    drop_table :site_component_maps
  end
end
