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
      form.destroy
      redirect_to forms_url, notice: 'Form was successfully destroyed.'
    end

    private

      def forms
        @forms ||= Form.all
      end

      def form
        @form ||= case action_name
                  when 'new'
                    Form.new
                  when 'create'
                    Form.new(form_params)
                  else
                    logger.debug "action rendered: #{action_name}"
                    Form.find(params[:id])
                  end
      end

      # Only allow a trusted parameter "white list" through.
      def form_params
        params.require(:form).permit(:name, :description, :document)
      end
  end
end
