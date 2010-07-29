require "sword/site_template/<%= site_template_name %>"

class <%= migration_class_name %> < ActiveRecord::Migration

  def self.up
    theme = Theme.find_by_name( "<%= theme %>" )  || Theme.first
    site  = Site.create!( :name => "<%= site_name %>", :host => "<%= host %>" , 
                        :theme_id => theme.id, :theme_options => theme.options,
                        :options => {}, :description => "description for <%= site_name %>" )
    Sword::SiteTemplate::<%= site_template_name.camelize %>.create( site ) 
  end

  def self.down
    site = Site.find_by_name( "<%= site_name %>" )
    if( site )
      Sword::SiteTemplate::<%= site_template_name.camelize %>.destroy( site )
      site.destroy
    end
  end

end
