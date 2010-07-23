class SwordEngineCreateGadgetPositionMaps < ActiveRecord::Migration
  def self.up
    create_table :gadget_position_maps do |t|
      t.integer :gadget_id
      t.integer :position_id
      t.text :options
      t.integer :sort_value

      t.timestamps
    end
  end

  def self.down
    drop_table :gadget_position_maps
  end
end
