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

      def copy_initializer_and_config
        copy_file 'skooter.rb', 'config/initializers/skooter.rb'
        copy_file 'skooter_config.yml', 'config/skooter_config.yml'
      end
    end
  end
end
