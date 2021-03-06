require 'rails/generators/active_record'
require 'sword/generators/helper'

module Sword
  module Generators
    class ComponentModelGenerator < ActiveRecord::Generators::Base
      include Rails::Generators::ResourceHelpers
      include Sword::Generators::Helper

      source_root File.expand_path('../templates', __FILE__)
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      check_class_collision

      class_option :migration,  :type => :boolean, :default => true
      class_option :timestamps, :type => :boolean, :default => true
      class_option :parent,     :type => :string, :desc => "The parent class for the generated model"

      def create_migration_file
        return unless options[:migration] && options[:parent].nil?
        migration_template "migration.rb", "db/migrate/#{package_file_name}_create_#{table_name}.rb"
      end

      def create_model_file
        template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")
      end

      def create_module_file
        return if class_path.empty?
        template 'module.rb', File.join('app/models', "#{class_path.join('/')}.rb") if behavior == :invoke
      end

      hook_for :test_framework, :as => :model 

      protected

        def parent_class_name
          options[:parent] || "ActiveRecord::Base"
        end

    end
  end
end
