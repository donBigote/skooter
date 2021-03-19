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

    # This config area works with rack-cors gem, and allows requests to the API
    # by any client provided that the request was requested by the app

    # This may not be necessary in Rails 6.

    # Another issue with Rails 6 is whitelisting the config.hosts in development.rb and production.rb
    # see this article: https://www.fngtps.com/2019/rails6-blocked-host/
    # In development.rb you can use:
    # config.hosts.clear

    # In production.rb you can use:
    # Whitelist one hostname
    # config.hosts << "hostname"
    # Whitelist a test domain
    # config.hosts << /application\.local\Z/

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

RUBY
      end
      # def copy_initializer_and_config
      #   copy_file 'skooter.rb', 'config/initializers/skooter.rb'
      #   copy_file 'skooter_config.yml', 'config/skooter_config.yml'
      # end
    end
  end
end
