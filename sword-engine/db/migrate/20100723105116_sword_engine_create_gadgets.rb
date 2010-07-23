class SwordEngineCreateGadgets < ActiveRecord::Migration
  def self.up
    create_table :gadgets do |t|
      t.string :name
      t.string :controller
      t.string :view

      t.timestamps
    end
    component = Component.create!( :name => "gadgets", 
                      :context => "sword_engine",
                      :description => "describe gadgets",
                      :controller => "gadgets",
                      :menu_view => "menu", 
                      :options  => {} )
    component.create_actions( :index, :show, :edit, :create, :delete )                      
    component.create_menu( [ "administer", "system" ,"gadgets" ], "description for gadgets", "index" )

  end

  def self.down
    component = Component.file_by_controller( "gadgets" )
    if( component )
      component.destroy
    end
    drop_table :gadgets
  end
end
