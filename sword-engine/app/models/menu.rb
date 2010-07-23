class Menu < ActiveRecord::Base
  
  validates_presence_of   :name, :description, :options, :operation_id 
  validates_uniqueness_of :name, :scope => [ :parent_menu_id ]
  
  belongs_to :parent_menu, :class_name => "Menu"
  has_many   :child_menus, :class_name => "Menu", :foreign_key => :parent_menu_id

  serialize :options 


  def self.create_menu( fields, options, operation, description )
    menu = nil
    fields.each{|field|
      parent_menu_id = menu ? menu.id : nil
      menu = Menu.where( :parent_menu_id => parent_menu_id ).find_by_name( field ) ||
        Menu.create!( :name => field, :description => description, 
                     :url => nil, :options => options,
                     :parent_menu_id => parent_menu_id,
                     :operation_id => operation.id )
    }
    return menu
  end

end
