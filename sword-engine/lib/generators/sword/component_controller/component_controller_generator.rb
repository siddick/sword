require 'rails/generators/resource_helpers'
require 'sword/generators/helper'


module Sword
  module Generators
    class ComponentControllerGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      include Sword::Generators::Helper

      source_root File.expand_path('../templates', __FILE__)

      check_class_collision :suffix => "Controller"

      class_option :orm, :banner => "NAME", :type => :string, :required => true,
                         :desc => "ORM to generate the controller for"

      class_option :singleton, :type => :boolean, :desc => "Supply to create a singleton controller"

      def create_controller_files
        template 'controller.rb', File.join('app/controllers', class_path, "#{controller_file_name}_controller.rb")
      end

      hook_for :template_engine, :test_framework, :as => :component_controller

      # Invoke the helper using the controller name (pluralized)
      hook_for :helper, :in => :rails, :as => :scaffold do |invoked|
        invoke invoked, [ controller_name ]
      end

    end
  end
end
