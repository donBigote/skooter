# require_dependency 'skooter/application_controller'
module Skooter
  class OdkController < ApplicationController
    ## Resource for use ActiveSupport Concerns in order to make overwritable methods for ODK
    # Source
    # http://stackoverflow.com/questions/7719633/how-to-extend-rails-engines-controllers-properly
    # http://edgeguides.rubyonrails.org/engines.html#overriding-models-and-controllers
    ##
    ##
    ## Github Gist: https://gist.github.com/trejo08/11df06b3c6ff8fa26c610447005b721f

    include Skooter::BaseOdkControllerActions
    before_action :set_header, only: %i[index submissions]

    private

      def set_header
        response.headers['X-OpenRosa-Version'] = '1'
        response.headers['Content-Type'] = 'text/xml; charset=utf-8'
      end

    #   def set_model(raw_params)
    #     model = ''
    #     plural_models.each_with_index do |item, index|
    #       next unless raw_params.has_key?(item.to_s)
    #       model = item.to_s
    #     end
    #     model
    #   end

    #   def get_model_columns(model)
    #     "Olpe::#{model.singularize.camelize}".constantize.column_names
    #   end

    #   def forms_list
    #     SKOOTER_CONFIG['SKOOTER_MODELS']
    #   end

    #   def plural_models
    #     %w(cisterns generic_lines images locations main_lines networks points polygons production_reports pumping_lines pumps quality_reports recharge_zones service_reports tanks substations system_reports treatments water_sources device_id)
    #   end

    #   def prepare_object(model, raw_params)
    #     obj = {}
    #     columns = get_model_columns(model)

    #     columns.each do |column|
    #       case column
    #       when 'meta_instance_id'
    #         obj[:meta_instance_id] = raw_params[model]['meta']['instanceID'].split(':')[1]
    #       when 'device_id'
    #         obj[:device_id] = raw_params[model]['meta_data_group']['deviceid']
    #       when 'coordinates'
    #         obj[:line] = split_lines(raw_params[model]['coordinates'])
    #       when 'latitude'
    #         obj[:latitude] = split_lat_lng(raw_params[model]['coordinates'])[0]
    #       when 'longitude'
    #         obj[:longitude] = split_lat_lng(raw_params[model]['coordinates'])[1]
    #       when 'elevation'
    #         obj[:elevation] = split_lat_lng(raw_params[model]['coordinates'])[2]
    #       when 'image_uid'
    #         unless raw_params[model]['image'].nil?
    #           obj[:image] = read_image(raw_params[model]['image'])
    #         end
    #       when 'photo_uid'
    #         unless raw_params[model]['image'].nil?
    #           obj[:photo] = read_image(raw_params[model]['image'])
    #         end
    #       end
    #     end

    #     raw_params[model].each do |key, value|
    #       next unless key.split('_')[1] == 'group'
    #       value.each do |subkey, subvalue|
    #         columns.each do |column|
    #           next unless subkey == column
    #           obj[column.to_sym] = subvalue
    #         end
    #       end
    #     end

    #     columns.each do |column|
    #       next unless raw_params[model].has_key?(column.to_s)
    #       if column != 'id' && column != 'coordinates' # && column != "image"
    #         obj[column.to_sym] = raw_params[model][column]
    #       end
    #     end

    #     obj
    #   end

    #   def split_lines(coordinates)
    #     object = []
    #     coordinates.split(';').each do |item|
    #       hash = {}
    #       hash[:lat] = item.split(' ')[0]
    #       hash[:lng] = item.split(' ')[1]
    #       object << hash
    #     end
    #     object
    #   end

    #   def split_lat_lng(coordinates)
    #     coordinates.split(' ')
    #   end

    #   def read_image(image)
    #     File.new(params["#{image}"].path)
    #   end
  end
end
