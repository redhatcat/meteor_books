module Widget
  module Header
    # The simplest meteor widget for demonstration purposes.
    #
    # Creates a new <h1/> elements containing text specified.
    #
    # Can be rendered with the following:
    #
    #   Meteor::RendererBase.new(
    #     :spec => Widget::Header::Spec.new("Hello, world!"),
    #     :controller => self,
    #     :frontend => "header",
    #     :id => params[:id]
    #   ).render
    #
    # Hits its partial, app/views/meteor/header/_render.rhtml.
    class Spec < Meteor::SpecBase
      attr_accessor :name
      attr_accessor :text
      attr_accessor :options
      def initialize(text, options={})
        defaults = {
          :name => 'header'
        }
        @text = text
        @options = defaults.merge(options)
        @name = @options[:name]
      end
    end
  end
end
