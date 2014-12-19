module Formtastic
  module LocalizedString

    def model_name
      if @object.class.respond_to?(:model_name)
        @object.class.model_name.i18n_key
      elsif @object.present?
        @object.class.name
      else
        @object_name.to_s.classify
      end
    end

    protected

    def localized_string(key, value, type, options = {}) # @private
      current_builder = respond_to?(:builder) ? builder : self
      localizer = Formtastic::FormBuilder.i18n_localizer.new(current_builder)
      localizer.localize(key, value, type, options)
    end

  end
end
