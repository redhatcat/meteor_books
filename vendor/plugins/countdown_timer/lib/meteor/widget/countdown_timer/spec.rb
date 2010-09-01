module Meteor
  module Widget
    module CountdownTimer
      # You've generated a new Meteor Widget!
      #
      # Your new widget can be rendered with the following:
      #
      # <%= render_meteor_widget(::Meteor::Widget::CountdownTimer::Spec.new(...) -%>
      #   
      # This renders its partial, app/views/meteor/countdown_timer/_render.rhtml.
      #
      # In your partial you can get a hold of your spec object with a local cal
      
      class Spec < ::Meteor::PluginSpecBase

        include MeteorWidgetPlugin

        attr_accessor :day
        attr_accessor :month
        attr_accessor :year

        def initialize(options={},&block)
          super(options,&block)
          raise "set :day :month and :year" unless day and month and year
        end
      end
    end
  end
end
