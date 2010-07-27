class SwordEngineCreateNewThemeSimple < ActiveRecord::Migration
  def self.up
    Theme.create!( :name => "<%= name %>", :description => "A <%= name %> theme.", :options => {} )
  end

  def self.down
    theme = Theme.find_by_name "<%= name %>"
    if( theme )
      theme.destroy
    end
  end
end
