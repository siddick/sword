class <%= migration_class_name %> < ActiveRecord::Migration

  def self.up
    SiteTemplate.create!( :name => "<%= template_name %>" )
  end

  def self.down
    site_template = SiteTemplate.find_by_name( "<%= template_name %>" )
    if( site_template )
      site_template.destroy
    end
  end

end
