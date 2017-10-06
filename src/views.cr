require "../libs/link_archiver/views.cr"
module Views
  class RootHandler < LinkArchiver::TextView
    def get(path : String, request : HTTP::Request, response : HTTP::Server::Response)
      response.print "We Root Made It!"
    end
  end

  class TestHandler < LinkArchiver::JSONView
    def get(path : String, request : HTTP::Request, response : HTTP::Server::Response)
      response.print "We Test Made It!"
    end
  end
end
