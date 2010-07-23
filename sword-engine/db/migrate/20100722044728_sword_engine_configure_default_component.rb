class SwordEngineConfigureDefaultComponent < ActiveRecord::Migration
  def self.up 
    # Create Component for Role.
    role_component = Component.create!( :name => "role", :context => "admin", :controller => "roles",
                      :menu_view => nil, :options => {},
                      :description => "Role Management" )
    role_component.create_actions( :index, :view, :edit, :create, :delete )

    # Create Component for Component
    component = Component.create!( :name => "component", :context => "admin", 
                                  :controller => "components", :menu_view => nil, 
                                  :options => {}, :description => "Component Management" )
    component.create_actions( :index, :view, :update )
    
    # Create Component for Menu
    menu_component = Component.create!( :name => "menu", :context => "admin",
                                  :controller => "menus", :menu_view => nil,
                                  :options => {}, :description => "Menu Management" )
    menu_component.create_actions( :index, :view, :edit, :create, :delete, :administer )


    oper = Operation.where( :action => "administer", :component_id => menu_component.id ).first
    Menu.create_menu( [ "administer" ],
                     { :controller => "menus", :action => "administer" }, oper.id, "Adminsiter" )
    Menu.create_menu( [ "administer", "system" ],
                     { :controller => "menus", :action => "administer", :menu => "system" },
                     oper.id, "Adminsiter" )
    Menu.create_menu( [ "administer", "system", "roles" ],
                     { :controller => "roles", :action => "index" },
                     Operation.get_operation( "roles", "index" ), "Role Management" )
    Menu.create_menu( [ "administer", "system", "components" ],
                     { :controller => "components", :action => "index" },
                     Operation.get_operation( "components", "index" ), "Component Management" )
    Menu.create_menu( [ "administer", "system", "menus" ],
                     { :controller => "menus", :action => "index" }, 
                     Operation.get_operation( "menus", "index" ), "Menu Management" )

  end

  def self.down 
    component = Component.find_by_controller( "menus" )
    component.destroy! if component
    component = Component.find_by_controller( "components" )
    component.destroy! if component
    component = Component.find_by_controller( "roles" )
    component.destroy! if component
  end

end
