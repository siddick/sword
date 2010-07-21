class SwordEngineCreateOperations < ActiveRecord::Migration
  def self.up
    create_table :operations do |t|
      t.integer :component_id
      t.string :action
      t.string :description

      t.timestamps
    end

  end

  def self.down
    drop_table :operations
  end
end
