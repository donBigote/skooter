# frozen_string_literal: true

module Skooter
  ##
  module BaseOdkControllerActions
    extend ActiveSupport::Concern

    def self.included(base)
      base.before_action :set_header, only: %i[index submissions]
      base.respond_to :xml
    end

    def index
      @forms = Skooter::Form.order(:name)
      respond_to do |format|
        format.xml { render 'index.xml' }
      end
    end

    def show
      doc = Skooter::Form.find(params[:id])
      if SKOOTER_CONFIG['PAPERCLIP_STORAGE'] == :s3 || :S3
        redirect_to doc.document.expiring_url(10.minutes.to_i)
      else
        send_file doc.document.path, type: doc.document_content_type, disposition: 'inline'
      end
    end

    def submissions
      if request.method.eql?('POST')
        # put your logic code here like the below example
        # hash = Crack::XML.parse(File.read(params[:xml_submission_file].path))
        # model = set_model(hash)
        model = 'nothing_device'

        if model != 'device_id'
        #   object = prepare_object(model, hash)
        #   form = "Olpe::#{model.singularize.camelize}".constantize.new(object)
        #   respond_to do |format|
        #     if form.save
        #       format.xml { render status: 201 }
        #     else
        #       format.xml { render status: form.errors.messages }
        #     end
        #   end
        else
          render status: 201
        end
      else
        render status: 204
      end
    end

    private

      def set_header
        response.headers['X-OpenRosa-Version'] = '1'
        response.headers['Content-Type'] = 'text/xml; charset=utf-8'
      end
  end
end