class <%= migration_class_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
<% for attribute in attributes -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>
<% if options[:timestamps] %>
      t.timestamps
<% end -%>
    end
    component = Component.create!( :name => "<%= table_name %>", 
                      :context => "<%= package_file_name %>",
                      :description => "describe <%= table_name %>",
                      :controller => "<%= table_name %>",
                      :menu_view => "menu", 
                      :options  => {} )
    component.create_actions( :index, :show, :edit, :create, :delete )                      
    component.create_menu( [ "administer", "site_configuration" ,"<%= table_name %>" ], "description for <%= table_name %>", "index" )

  end

  def self.down
    component = Component.file_by_controller( "<%= table_name %>" )
    if( component )
      component.destroy
    end
    drop_table :<%= table_name %>
  end
end
