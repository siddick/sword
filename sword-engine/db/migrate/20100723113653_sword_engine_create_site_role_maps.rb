class SwordEngineCreateSiteRoleMaps < ActiveRecord::Migration
  def self.up
    create_table :site_role_maps do |t|
      t.integer :site_id
      t.integer :role_id

      t.timestamps
    end

  end

  def self.down
    drop_table :site_role_maps
  end
end
