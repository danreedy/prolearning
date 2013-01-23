module Dresssed
  module SimpleForm
    # Custom SimpleForm component to add a 'Required' tag next to required inputs when
    # there are no errors.
    class RequiredComponent < ComponentBase
      def required_field?
        @input.send(:required_field?)
      end
      
      def render
        required_tag if required_field? && !@input.has_errors?
      end
      
      def required_tag
        template.content_tag :div,
                             template.icon_tag("asterisk") + " " + translate_required_text,
                             :class => "help-inline"  
      end
      
      def translate_required_text
        I18n.t(:"simple_form.required.text", :default => 'required')
      end
    end
  end
end