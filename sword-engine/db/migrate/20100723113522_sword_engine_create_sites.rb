class SwordEngineCreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name
      t.string :host
      t.string :description
      t.integer :theme_id
      t.text :theme_options
      t.text :options

      t.timestamps
    end
    component = Component.create!( :name => "sites", 
                      :context => "sword_engine",
                      :description => "describe sites",
                      :controller => "sites",
                      :menu_view => "menu", 
                      :options  => {} )
    component.create_actions( :index, :show, :edit, :create, :delete )                      
    component.create_menu( [ "administer", "system" ,"sites" ], "description for sites", "index" )

  end

  def self.down
    component = Component.file_by_controller( "sites" )
    if( component )
      component.destroy
    end
    drop_table :sites
  end
end
