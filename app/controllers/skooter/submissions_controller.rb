require_dependency 'skooter/application_controller'

module Skooter
  class SubmissionsController < ApplicationController
    def index
      render 'index'
    end
  end
end
