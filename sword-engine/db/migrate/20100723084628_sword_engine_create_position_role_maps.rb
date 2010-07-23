class SwordEngineCreatePositionRoleMaps < ActiveRecord::Migration
  def self.up
    create_table :position_role_maps do |t|
      t.integer :position_id
      t.integer :role_id

      t.timestamps
    end

  end

  def self.down
    drop_table :position_role_maps
  end
end
