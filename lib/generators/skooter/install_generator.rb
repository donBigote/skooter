require 'rails/generators/migration'
module Skooter
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def self.source_root
        File.expand_path('../templates', __FILE__)
      end

      def generate_install
        rake 'skooter:install:migrations'
      end

      def setup_routes
        route "mount Skooter::Engine => '/skooter'"
      end

      def setup_rails_cors
        inject_into_file "config/application.rb", cors_code, after: "class Application < Rails::Application\n"
      end

      def cors_code
<<RUBY
  # Rails 5
  # this config area works with rack-cors gem, and allow requests to the API by
  # any client provided that the requests has to be requested by the ElectronApp
  config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins "*"
      resource "*", headers: :any, methods: [:get, :post, :options]
    end
  end
RUBY
      end

      def copy_initializer_and_config
        copy_file 'skooter.rb', 'config/initializers/skooter.rb'
        copy_file 'skooter_config.yml', 'config/skooter_config.yml'
      end
    end
  end
end
