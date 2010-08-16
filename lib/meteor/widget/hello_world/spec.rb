module Meteor
  module Widget
    module HelloWorld
      # The simplest meteor widget for demonstration purposes.
      #
      # Creates a new <h1/> elements containing text specified.
      #
      # Can be rendered with the following:
      #
      # <%= render_meteor_widget(::Meteor::Widget::HelloWorld::Spec.new(...) -%>
      #   
      # Hits its partial, app/views/meteor/hello_world/_render.rhtml.

      class Spec < ::Meteor::SpecBase
        def initialize(options={},&block)
          super(options,&block)
        end
      end
    end
  end
end
