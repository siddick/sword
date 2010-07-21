require 'rails/generators/resource_helpers'
# require 'rails/generators/rails/model/model_generator'
# require 'generators/sword/component_model/component_model_generator'
require 'rails/generators/active_record'
require 'active_support/core_ext/object/blank'

module Sword
  module Generators
    class ComponentGenerator < Rails::Generators::NamedBase #ActiveRecord::Generators::Base
      # Sword::Generators::ComponentModelGenerator
      # Rails::Generators::Base # Rails::Generators::ModelGenerator
      # Sword::Generators::ComponentModelGenerator
      # source_root File.expand_path('../templates', __FILE__)
      source_root File.expand_path('../templates', __FILE__)
      include Rails::Generators::ResourceHelpers
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"


      class_option :singleton, :type => :boolean, :desc => "Supply to create a singleton controller"

      class_option :component_model, :type => :string, :default => :component_model 
      class_option :component_controller, :type => :string, :default => :component_controller

      hook_for :component_model, :in => :sword ,  :required => true

      def add_resource_route
        return if options[:actions].present?
        route_config =  class_path.collect{|namespace| "namespace :#{namespace} do " }.join(" ")
        route_config << "resource#{:s unless options[:singleton]} :#{pluralize?(file_name)}"
        route_config << " end" * class_path.size 
        route route_config
      end   

      hook_for :component_controller, :in => :sword,  :required => true
      hook_for :stylesheets, :in => :rails 


      protected

      def pluralize?(name)
        if options[:singleton]
          name
        else
          name.pluralize
        end
      end

    end
  end
end
