class SwordEngineCreateOperationRoleMaps < ActiveRecord::Migration
  def self.up
    create_table :operation_role_maps do |t|
      t.integer :operation_id
      t.integer :role_id

      t.timestamps
    end

  end

  def self.down
    drop_table :operation_role_maps
  end
end
