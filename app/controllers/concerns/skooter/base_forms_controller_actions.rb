# frozen_string_literal: true

module Skooter
  ##
  module BaseFormsControllerActions
    extend ActiveSupport::Concern

    def self.included(base)
      base.helper_method :form, :forms
      base.respond_to :html
    end

    def create
      if form.save
        redirect_to form, notice: 'Form was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /forms/1
    def update
      if form.update(form_params)
        redirect_to form, notice: 'Form was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /forms/1
    def destroy
      logger.debug "=========> accion delete"
      form.destroy
      redirect_to forms_url, notice: 'Form was successfully destroyed.'
    end

    private

      def forms
        logger.debug "=========> accion en index"
        @forms ||= Form.all
      end

      def form
        logger.debug "=========> entro al form #{action_name}"
        @form ||= case action_name
                  when 'new'
                    Form.new
                  when 'create'
                    Form.new(form_params)
                  else
                    logger.debug "accion renderizada: #{action_name}"
                    Form.find(params[:id])
                  end
      end

      # Only allow a trusted parameter "white list" through.
      def form_params
        params.require(:form).permit(:name, :document, :description, :model_source)
      end
  end
end
