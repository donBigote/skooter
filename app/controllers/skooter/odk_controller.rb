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
      if SKOOTER_CONFIG['PAPERCLIP_STORAGE'] == :s3 || :S3
        redirect_to doc.document.expiring_url(10.minutes)
      else
        send_file doc.document.path, type: doc.document_content_type, disposition: 'inline'
      end
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
