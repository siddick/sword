class SwordEngineCreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :name
      t.integer :parent_position_id
      t.string :description
      t.text :options
      t.boolean :frozen_position
      t.integer :sort_value

      t.timestamps
    end
    component = Component.create!( :name => "positions", 
                      :context => "sword_engine",
                      :description => "describe positions",
                      :controller => "positions",
                      :menu_view => "menu", 
                      :options  => {} )
    component.create_actions( :index, :show, :edit, :create, :delete )                      
    component.create_menu( [ "administer", "system" ,"positions" ], "description for positions", "index" )

  end

  def self.down
    component = Component.file_by_controller( "positions" )
    if( component )
      component.destroy
    end
    drop_table :positions
  end
end
