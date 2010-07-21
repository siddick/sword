class Component < ActiveRecord::Base
  validates_presence_of   :name, :context, :description, :controller
  validates_uniqueness_of :name, :scope => [ :context ]
  validates_uniqueness_of :controller
  
  has_many :operations, :dependent => :destroy

  serialize :options

  def create_actions( *actions )
    actions.each{|action|
      Operation.create!( :component_id => self.id, :action => action.to_s, 
                        :description => "#{self.controller}##{action}")
    }
  end

  def create_menu( fields, description, action = "index" )
    operation = Operation.first( :conditions => { :action => action, :component_id => self.id } )
    options = { 
      :controller => self.controller,
      :action => action 
    }
    Menu.create_menu( fields, options, operation, description  )
  end

end
