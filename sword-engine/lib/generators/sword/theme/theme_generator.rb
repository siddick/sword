require 'rails/generators/active_record'
require 'sword/generators/helper'

module Sword
  module Generators
    class ThemeGenerator < ActiveRecord::Generators::Base # Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      include Sword::Generators::Helper

      source_root File.expand_path('../templates', __FILE__)

      class_option :clone, :type => :string, :default => "simple"

      def create_migrate
        migration_template "migration.rb", "db/migrate/#{package_file_name}_create_new_theme_#{name}.rb"
      end

      def create_js
        [ 'default' ].each{|js_name|
            template "js/#{js_name}.js", "public/themes/#{name}/js/#{js_name}.js"
        }
      end

      def create_css
        [ 'default' ].each{|css_name|
            template "css/#{css_name}.css", "public/themes/#{name}/css/#{css_name}.css"
        }
      end

      def create_layout
          [ 'default', 'home', 'login', 'print' ].each{|layout_name|
            template "layout/#{layout_name}.html.erb", "app/views/layouts/themes/#{name}/#{layout_name}.html.erb"
          }
      end
    end
  end
end
