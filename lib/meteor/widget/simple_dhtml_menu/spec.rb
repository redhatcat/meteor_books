module Meteor
  module Widget
    module SimpleDhtmlMenu
      # The simplest meteor widget for demonstration purposes.
      #
      # Creates a new <h1/> elements containing text specified.
      #
      # Can be rendered with the following:
      #
      # <%= render_meteor_widget(::Meteor::Widget::SimpleDhtmlMenu::Spec.new(...) -%>
      #   
      # Hits its partial, app/views/meteor/simple_dhtml_menu/_render.rhtml.

      class Spec < ::Meteor::SpecBase

        attr_accessor :menu_items

        def initialize(options={},&block)
          self.menu_items = []
          super(options,&block)
        end
      end
    end
  end
end
