class SwordEngineCreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.string :name
      t.string :description
      t.text :options

      t.timestamps
    end
    component = Component.create!( :name => "themes", 
                      :context => "sword_engine",
                      :description => "describe themes",
                      :controller => "themes",
                      :menu_view => "menu", 
                      :options  => {} )
    component.create_actions( :index, :show, :edit, :create, :delete )                      
    
    component.create_menu( [ "administer", "system" ,"themes" ], "description for themes", "index" )

  end

  def self.down
    component = Component.file_by_controller( "themes" )
    if( component )
      component.destroy
    end
    drop_table :themes
  end
end
