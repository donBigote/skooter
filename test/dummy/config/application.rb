require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require 'skooter'

module Dummy
  class Application < Rails::Application
    # Rails 5
    # this config area works with rack-cors gem, and allow requests to the API
    #  by any client provided that the requests has to be requested by the
    # ElectronApp
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
