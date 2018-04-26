module Skooter::BaseOdkControllerActions
  extend ActiveSupport::Concern

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
    if request.method == 'POST'
      hash = Crack::XML.parse(File.read(params[:xml_submission_file].path))
      # put your logic code here like the below example
      # model = set_model(hash)

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
end