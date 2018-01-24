module Skooter
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def self.source_root
        File.expand_path('../templates', __FILE__)
      end

      def setup_routes
        route "mount Skooter::Engine => '/skooter'"
      end

      def copy_skooter_migration
        migration_template
      end

      def migration_data
        <<RUBY
        RUBY
      end

      def rails5?
        Rails.version.start_with? '5'
      end

      def migration_version
       if rails5?
         "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
       end
     end
    end
  end
end
