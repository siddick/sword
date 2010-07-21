require 'lib/sword-engine'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'sword-engine'
  s.version     = SwordEngine::Version
  s.summary     = 'Sword is a Flexible Content Management System.'
  s.description = 'This Sword will give power to play on warfield.'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Mohammed Siddick.E'
  s.email             = 'siddick@gmail.com'
  s.homepage          = 'http://sword.siddick.com'


  package_files = Dir['CHANGELOG', 'README', 'bin/**/*', 'lib/**/*', 'app/**/*', 'config/routes.rb' ]
  package_files.delete( 'app/controllers/application_controller.rb' )
  package_files.delete( 'app/helpers/application_helper.rb' )

  s.files              = package_files
  s.require_path       = 'lib'

#  s.rdoc_options << '--exclude' << '.'
#  s.has_rdoc = false

  s.add_dependency('rails',          ">= #{Rails::VERSION::STRING} ")
end
