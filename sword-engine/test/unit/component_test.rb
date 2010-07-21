require 'test_helper'

class ComponentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    component = Component.create!( :name => "user_manangement", 
                      :context => "admin",
                      :description => "Describe User Management",
                      :controller => "user_manangement",
                      :menu_view => "menu", 
                      :options  => {
                        :max_user => 5
                      } )
    component.create_actions( :index, :view, :edit, :create, :delete )                      
    component.create_menu( [ "administer", "site_configuration" ,"<%= table_name %>" ], "description for <%= table_name %>", "index" )
    assert true
  end
end
