class SwordEngineCreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :header
      t.integer :content_id

      t.timestamps
    end
    component = Component.create!( :name => "pages", 
                      :context => "sword_engine",
                      :description => "describe pages",
                      :controller => "pages",
                      :menu_view => "menu", 
                      :options  => {} )
    component.create_actions( :index, :show, :edit, :create, :delete )                      
    Menu.create_menu( [ "administer", "content" ],
                     { :controller => "menus", :action => "administer", :menu => "content" },
                     Operation.get_operation( "menus", "administer" ), "Site Contents" )
    component.create_menu( [ "administer", "content" ,"pages" ], "description for pages", "index" )

  end

  def self.down
    component = Component.file_by_controller( "pages" )
    if( component )
      component.destroy
    end
    drop_table :pages
  end
end
