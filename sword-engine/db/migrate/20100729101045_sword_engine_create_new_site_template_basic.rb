class SwordEngineCreateNewSiteTemplateBasic < ActiveRecord::Migration

  def self.up
    SiteTemplate.create!( :name => "basic" )
  end

  def self.down
    site_template = SiteTemplate.find_by_name( "basic" )
    if( site_template )
      site_template.destroy
    end
  end

end
