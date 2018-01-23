require_dependency 'skooter/application_controller'

module Skooter
  class OdkController < ApplicationController
    def index
      set_header
      @forms = Skooter::Form.order(:name)
      respond_to do |format|
        format.xml { render 'index.xml' }
      end
    end

    def show
      doc = Skooter::Form.find(params[:id])
      send_file doc.document.path, type: doc.document_content_type, disposition: 'inline'
    end

    def submissions
    end

    private

      def set_header
        response.headers['X-OpenRosa-Version'] = '1'
        response.headers['Content-Type'] = 'text/xml; charset=utf-8'
      end
  end
end
