
class Sword::Generators::DevGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :package_name,    :type => :string
  argument :package_version, :type => :string, :default => '1.0.0'

  def generate_dev_environment
    template "tasks.rb", "lib/tasks/sword.rake"
    template "gemspec", "#{package_name}.gemspec"
    template "package.rb", "lib/#{package_name}.rb"
    template "application_controller.rb",
      "app/controllers/#{package_file_name}_application_controller.rb"
    copy_file "routes.rb", "config/routes.rb" if behavior == :invoke
  end

  private 
  def class_name 
    @class_name ||= package_file_name.camelize
  end

  def package_file_name
    @package_file_name ||= package_name.gsub(/-/, '_')
  end

end
