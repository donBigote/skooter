$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'skooter/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'skooter'
  s.version     = Skooter::VERSION
  s.authors     = ['Juan Trejo']
  s.email       = ['juan@dataconsulta.com']
  s.homepage    = 'https://github.com/KandFConsulting/skooter'
  s.summary     = 'This engine/gem helps you to automatize process to collect data from ODK Collect using your own server to serve and collect the data directly from de device without pass through another intermediate'
  s.description = 'Aplicación intermediaria entre ODK y un proyecto rails.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'aws-sdk', '~> 3'
  s.add_dependency 'haml-rails', '~> 1.0'
  s.add_dependency 'paperclip'
  s.add_dependency 'rack-cors' # , require: "rack/cors"
  # s.add_dependency 'rails', '~> 5.1.2'
  s.add_dependency 'rails', '>= 5.1.2'
  s.add_dependency 'simple_form'
  s.add_dependency 'responders'

  # s.add_development_dependency 'pg'
end
