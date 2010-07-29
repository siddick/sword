require "sword/site_template/basic"

class CreateNewSiteMysite < ActiveRecord::Migration

  def self.up
    theme = Theme.find_by_name( "simple" )  || Theme.first
    site  = Site.create!( :name => "mysite", :host => "*" , 
                        :theme_id => theme.id, :theme_options => theme.options,
                        :options => {}, :description => "description for mysite" )
    Sword::SiteTemplate::Basic.create( site ) 
  end

  def self.down
    site = Site.find_by_name( "mysite" )
    if( site )
      Sword::SiteTemplate::Basic.destroy( site )
      site.destroy
    end
  end

end
