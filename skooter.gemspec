$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "skooter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "skooter"
  s.version     = Skooter::VERSION
  s.authors     = ["Juan Trejo"]
  s.email       = ["juan@dataconsulta.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Skooter."
  s.description = "Aplicación intermediaria entre ODK y un proyecto rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.2"

  s.add_development_dependency "pg"
end
