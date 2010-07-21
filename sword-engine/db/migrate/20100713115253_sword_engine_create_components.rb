class SwordEngineCreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.string :name
      t.string :context
      t.string :description
      t.string :controller
      t.string :menu_view
      t.text :options

      t.timestamps
    end

    add_index :components, :context
  end

  def self.down
    drop_table :components
  end
end
