require "http"

require "./views.cr"

module LinkArchiver
  alias SimpleRouteMap = Hash(String, LinkArchiver::View.class)

  class SimpleRouter
    def initialize(routes : SimpleRouteMap)
      @routes = routes
    end

    def route(context : HTTP::Server::Context)
      path = context.request.path
      responder_class = @routes.fetch(path)
      if !responder_class.nil?
        responder = responder_class.new()
        responder.dispatch(context)
      else
        puts "404"
      end
    end
  end
end
