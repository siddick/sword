module Sword
  module Generators
    class SiteTemplateGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
    end
  end 
end
