module LinkArchiver
  abstract class View
    def _get_method_for_verb(verb : String)
      verb = verb.downcase()
      case verb
      when "get"
        return ->get(String, HTTP::Request, HTTP::Server::Response)
      when "put"
        return ->put(String, HTTP::Request, HTTP::Server::Response)
      when "patch"
        return ->patch(String, HTTP::Request, HTTP::Server::Response)
      when "post"
        return ->post(String, HTTP::Request, HTTP::Server::Response)
      when "delete"
        return ->delete(String, HTTP::Request, HTTP::Server::Response)

      return map[verb]
    end
    abstract def dispatch(context : HTTP::Server::Context)
  end

  abstract class TextView < View
    def dispatch(context : HTTP::Server::Context)
      context.response.content_type = "text/plain"

      method = context.request.method
      method_to_call = self._get_method_for_verb(method)
      method_to_call.call(context.request.path, context.request, context.response)
    end
  end

  abstract class JSONView < View
    def dispatch(context : HTTP::Server::Context)
      context.response.content_type = "application/json"

      method = context.request.method
      method_to_call = self._get_method_for_verb(method)
      method_to_call.call(context.request.path, context.request, context.response)
    end
  end
end
