require "http/server"
require "../libs/link_archiver/link_archiver.cr"
require "./views.cr"

IP = "127.0.0.1"
PORT = 8080

ROUTES = {
  "/" => Views::RootHandler,
  "/test" => Views::TestHandler
}

def main()
  router = LinkArchiver::SimpleRouter.new(ROUTES)
  server = HTTP::Server.new(IP, PORT) do |ctext|
    router.route(ctext)
  end

  puts "Listening on http://#{IP}:#{PORT}"
  server.listen()
end

main()
