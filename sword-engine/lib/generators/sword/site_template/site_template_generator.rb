require 'rails/generators/active_record'
require 'sword/generators/helper'

module Sword
  module Generators
    class SiteTemplateGenerator < ActiveRecord::Generators::Base
      include Rails::Generators::ResourceHelpers
      include Sword::Generators::Helper
      source_root File.expand_path('../templates', __FILE__)

      def create_migration
        migration_template "migration.rb", "db/migrate/#{package_file_name}_create_new_site_template_#{template_name}.rb"
      end

      def create_template
        template "site_template.rb", "lib/sword/site_template/#{template_name}.rb"
      end

      private 

      def template_class_name
        template_name.camelize
      end

      def template_name
        name.gsub(/-/, '_')
      end
    end
  end 
end
