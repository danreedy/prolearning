module Dresssed
  module SimpleForm
    class ComponentBase
      def self.render(input)
        new(input).render
      end
      
      attr_reader :input
      
      delegate :object, :template, :to => :@input
      
      def initialize(input)
        @input = input
      end
      
      def self.find(name)
        nil
      end
    end
  end
end