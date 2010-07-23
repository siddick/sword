class SwordEngineCreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :name
      t.integer :parent_menu_id
      t.string :url
      t.text :options
      t.integer :operation_id
      t.integer :sort_value
      t.string :description

      t.timestamps
    end

  end

  def self.down
    drop_table :menus
  end
end
