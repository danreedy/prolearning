module Dresssed
  module SimpleForm
    # Custom SimpleForm component to render errors with a fancy icon.
    class ErrorsComponent < ComponentBase
      def render
        error_tag if @input.has_errors?
      end
      
      def error_text
        @input.send(:error_text)
      end
      
      def error_tag
        template.content_tag(:span, template.icon_tag("remove") + " " + error_text, :class => "help-inline")
      end
    end
  end
end