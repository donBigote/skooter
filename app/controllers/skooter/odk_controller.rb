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
        redirect_to doc.document.expiring_url(10.minutes.to_i)
      else
        send_file doc.document.path, type: doc.document_content_type, disposition: 'inline'
      end
    end

    def submissions
      set_header

      if request.method == "POST"
        hash = Crack::XML.parse(File.read(params[:xml_submission_file].path))
        model = set_model(hash)

        if model != "device_id"
          object = prepare_object(model, hash)
          form = "Olpe::#{model.singularize.camelize}".constantize.new(object)
          respond_to do |format|
            if form.save
              format.xml { render status: 201 }
            else
              format.xml { render status: form.errors.messages }
            end
          end
        else
          render status: 201
        end
      else
        render status: 204
      end
    end

    private
      def set_header
        response.headers["X-OpenRosa-Version"] = "1"
        response.headers["Content-Type"] = "text/xml; charset=utf-8"
      end

      def set_model(raw_params)
        model = ""
        plural_models.each_with_index do |item, index|
          next unless raw_params.has_key?(item.to_s)
          model = item.to_s
        end
        model
      end

      def get_model_columns(model)
        "Olpe::#{model.singularize.camelize}".constantize.column_names
      end

      def forms_list
        SKOOTER_CONFIG['SKOOTER_MODELS']
      end

      def plural_models
        %w(cisterns generic_lines images locations main_lines networks points polygons production_reports pumping_lines pumps quality_reports recharge_zones service_reports tanks substations system_reports treatments water_sources device_id)
      end

      def prepare_object(model, raw_params)
        object = {}
        columns = get_model_columns(model)

        columns.each do |column|
          case column
          when "meta_instance_id"
            object[:meta_instance_id] = raw_params[model]["meta"]["instanceID"].split(":")[1]
          when "device_id"
            object[:device_id] = raw_params[model]["meta_data_group"]["deviceid"]
          when "coordinates"
            object[:line] = split_lines(raw_params[model]["coordinates"])
          when "latitude"
            object[:latitude] = split_lat_lng(raw_params[model]["coordinates"])[0]
          when "longitude"
            object[:longitude] = split_lat_lng(raw_params[model]["coordinates"])[1]
          when "elevation"
            object[:elevation] = split_lat_lng(raw_params[model]["coordinates"])[2]
          when "image_uid"
            if !raw_params[model]["image"].nil?
              object[:image] = read_image(raw_params[model]["image"])
            end
          when "photo_uid"
            if !raw_params[model]["image"].nil?
              object[:photo] = read_image(raw_params[model]["image"])
            end
          end
        end

        raw_params[model].each do |key, value|
          next unless key.split("_")[1] == "group"
          value.each do |subkey, subvalue|
            columns.each do |column|
              next unless subkey == column
              object[column.to_sym] = subvalue
            end
          end
        end

        columns.each do |column|
          next unless raw_params[model].has_key?(column.to_s)
          if column != "id" && column != "coordinates" #&& column != "image"
            object[column.to_sym] = raw_params[model][column]
          end
        end

        object
      end

      def split_lines(coordinates)
        object = []
        coordinates.split(";").each do |item|
          hash = {}
          hash[:lat] = item.split(" ")[0]
          hash[:lng] = item.split(" ")[1]
          object << hash
        end
        object
      end

      def split_lat_lng(coordinates)
        coordinates.split(" ")
      end

      def read_image(image)
        File.new(params["#{image}"].path)
      end
  end
end
