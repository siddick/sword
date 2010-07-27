class SwordEngineCreateNewThemeSimple < ActiveRecord::Migration
  def self.up
    Theme.create!( :name => "simple", :description => "A simple theme.", :options => {} )
  end

  def self.down
    theme = Theme.find_by_name "simple"
    if( theme )
      theme.destroy
    end
  end
end
