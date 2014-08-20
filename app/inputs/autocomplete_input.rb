class AutocompleteInput < SimpleForm::Inputs::Base
  def input
    autocomplete_field << hidden_field
  end

  def input_html_classes
    super << 'form-control'
  end

  private

    def autocomplete_field
      @builder.text_field attribute_name, input_options
    end

    def hidden_field
      @builder.hidden_field "#{attribute_name}_id", id: id_field
    end

    def model
      attribute_name.to_s.classify.constantize
    end

    def url
      options.fetch(:url) { raise ArgumentError, 'You must supply a URL' }
    end

    def id_field
      "#{attribute_name}_id_#{object.object_id}"
    end

    def input_options
      {
        placeholder: model.model_name.human,
        title: model.model_name.human,
        value: object.send(attribute_name),
        data: {
          autocomplete_url: url,
          autocomplete_target: "##{id_field}"
        }
      }.deep_merge input_html_options
    end
end
