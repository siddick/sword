class Site < ActiveRecord::Base
  belongs_to :theme

  serialize :options
  serialize :theme_options
  

  cattr_reader :per_page
  @@per_page = 10
end
