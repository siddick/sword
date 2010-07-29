#require 'rails'
#require 'lib/sword-engine'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'sword-engine'
  s.version     = '1.0.0' # SwordEngine::Version
  s.summary     = 'Sword is a Flexible Content Management System.'
  s.description = 'This Sword will give power to play on warfield.'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Mohammed Siddick.E'
  s.email             = 'siddick@gmail.com'
  s.homepage          = 'http://sword.siddick.com'


  package_files = Dir['CHANGELOG', 'README', 'public/theme/**/*', 'db/migrate/*sword_engine*', 'bin/**/*', 'lib/**/*', 'app/**/*', 'config/routes.rb' ]
  package_files.delete( 'app/controllers/application_controller.rb' )
  package_files.delete( 'app/helpers/application_helper.rb' )
  package_files.delete( 'app/views/layouts/application.html.erb' )

  s.files              = package_files
  s.require_path       = 'lib'

#  s.rdoc_options << '--exclude' << '.'
#  s.has_rdoc = false

  s.add_dependency('rails',         ">= 3.0.0.rc" ) ##{Rails::VERSION::STRING} ")
  s.add_dependency('will_paginate', ">= 3.0.pre2" )
                   
end
