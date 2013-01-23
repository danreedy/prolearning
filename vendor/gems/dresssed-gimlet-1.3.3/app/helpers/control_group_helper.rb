module ControlGroupHelper
  class ControlGroupBuilder
    def initialize(template, attribute, form)
      @template = template
      @attribute = attribute
      @form = form
    end
    
    def has_errors?
      @form.object.respond_to?(:errors) && @form.object.errors[@attribute].any?
    end
    
    # Error message specific to one attribute to be shown inside a control group.
    def error_messages
      if has_errors?
        @template.content_tag :span,
          @template.icon_tag("remove") + " " + @form.object.errors[@attribute].to_sentence,
          :class => "help-inline"
      end  
    end
    
    def method_missing(name, *args, &block)
      if @form.respond_to?(name)
        @form.__send__(name, *args, &block)
      else
        super
      end
    end
  end
  
  module FormBuilderExtensions
    # Return a ControlGroupBuilder that can display error message specific to a single model attribute.
    # Usage inside a FormBuilder:
    # 
    #  <%= f.control_group :name do |f| %>
    #    ...
    #    <%= f.error_messages %> <== helper method only accessible inside the control_group block.
    #  <% end %>
    def control_group(attribute, &block)
      builder = ControlGroupBuilder.new(@template, attribute, self)
      @template.content_tag :div, @template.capture(builder, &block),
                            :class => "control-group #{'error' if builder.has_errors?}"
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, ControlGroupHelper::FormBuilderExtensions)