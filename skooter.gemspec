$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'skooter/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'skooter'
  s.version     = Skooter::VERSION
  s.authors     = ['K&F Consulting']
  s.email       = ['jefferson@dataconsulta.com']
  s.homepage    = 'https://github.com/donBigote/skooter'
  s.summary     = 'This gem helps you to automatate the process of collecting data with ODK Collect using your own server to serve xml forms to ODK Collect and receive data submissions from ODK Collect'
  s.description = 'A gem for connecting ODK Collect forms and a Rails application.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  
  s.add_dependency 'rack-cors'
  s.add_dependency 'rails', '>= 6.1.3'
  s.add_dependency 'responders'

end
