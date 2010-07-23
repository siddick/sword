class Operation < ActiveRecord::Base
  validates_presence_of   :component_id, :action, :description
  validates_uniqueness_of :component_id, :scope => [ :action ]

  has_many :menus, :dependent => :destroy
  has_many :roles, :class_name => "OperationRoleMap", :foreign_key => "operation_id", 
   :dependent => :destroy

  def self.get_operation( controller, action )
    component = Component.find_by_controller( controller )
    if( component )
      Operation.where( :component_id => component.id, :action => action ).first
    else
      nil
    end
  end
end
