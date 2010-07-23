class SwordEngineCreatePageRoleMaps < ActiveRecord::Migration
  def self.up
    create_table :page_role_maps do |t|
      t.integer :page_id
      t.integer :role_id

      t.timestamps
    end

  end

  def self.down
    drop_table :page_role_maps
  end
end
