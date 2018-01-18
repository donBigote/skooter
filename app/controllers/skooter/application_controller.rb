require_dependency 'skooter/application_controller'

module Skooter
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  end
end
