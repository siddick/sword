class SwordEngineCreateThemePositionMaps < ActiveRecord::Migration
  def self.up
    create_table :theme_position_maps do |t|
      t.integer :theme_id
      t.integer :position_id

      t.timestamps
    end

  end

  def self.down
    drop_table :theme_position_maps
  end
end
