require 'rails/generators/active_record'
require 'sword/generators/helper'

module Sword 
  module Generators
    class SiteGenerator < ActiveRecord::Generators::Base # Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      include Sword::Generators::Helper

      argument :host, :type => :string, :default => "*"
      argument :site_template, :type => :string, :default => "basic"
      argument :theme, :type => :string, :default => "simple"

      source_root File.expand_path('../templates', __FILE__)

      def create_migration
        migration_template "migration.rb", "db/migrate/create_new_site_#{site_name}.rb"
      end

      private
      def site_template_name
        site_template.gsub(/-/, '_')
      end

      def site_name 
        name.gsub(/-/, '_')
      end
    end
  end
end
