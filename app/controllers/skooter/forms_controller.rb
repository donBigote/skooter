# frozen_string_literal: true

module Skooter
  ##
  class FormsController < ApplicationController
    include Skooter::BaseFormsControllerActions
    def destroy
      logger.debug "=========> action delete"
      form.destroy
      redirect_to forms_url, notice: 'Form was successfully destroyed.'
    end
  end
end
