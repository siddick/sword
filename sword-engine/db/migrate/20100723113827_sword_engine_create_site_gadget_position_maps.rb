class SwordEngineCreateSiteGadgetPositionMaps < ActiveRecord::Migration
  def self.up
    create_table :site_gadget_position_maps do |t|
      t.integer :site_id
      t.integer :gadget_position_map_id

      t.timestamps
    end

  end

  def self.down
    drop_table :site_gadget_position_maps
  end
end
