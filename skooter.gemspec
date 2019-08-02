$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'skooter/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'skooter'
  s.version     = Skooter::VERSION
  s.authors     = ['K&F Consulting']
  s.email       = ['jefferson@dataconsulta.com']
  s.homepage    = 'https://github.com/KandFConsulting/skooter'
  s.summary     = 'This gem helps you to automatate the process of collecting data with ODK Collect using your own server to serve and collect the data directly from a device without passing through another intermediate'
  s.description = 'A gem for connecting ODK Collect forms and a Rails application.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'aws-sdk', '~> 3'
  s.add_dependency 'haml-rails', '~> 1.0'
  s.add_dependency 'paperclip'
  s.add_dependency 'rack-cors' # , require: "rack/cors"
  # s.add_dependency 'rails', '~> 5.1.2'
  s.add_dependency 'rails', '>= 5.2.2'
  s.add_dependency 'simple_form'
  s.add_dependency 'responders'

  # s.add_development_dependency 'pg'
end
