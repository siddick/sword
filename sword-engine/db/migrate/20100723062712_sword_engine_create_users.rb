class SwordEngineCreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :md5_password
      t.string :fullname
      t.boolean :enable
      t.text :options

      t.timestamps
    end
    component = Component.create!( :name => "users", 
                      :context => "sword_engine",
                      :description => "describe users",
                      :controller => "users",
                      :menu_view => "menu", 
                      :options  => {} )
    component.create_actions( :index, :show, :edit, :create, :delete )                      
    component.create_menu( [ "administer", "system" ,"users" ], "description for users", "index" )

  end

  def self.down
    component = Component.file_by_controller( "users" )
    if( component )
      component.destroy
    end
    drop_table :users
  end
end
