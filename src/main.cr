require "http/server"

IP = "127.0.0.1"
PORT = 8080

def main()
  server = HTTP::Server.new(IP, PORT) do |ctext|
    ctext.response.content_type = "text/plain"
    ctext.response.print "Hello world!"
  end

  print "Listening on http://#{IP}:#{PORT}"
  server.listen()
end

main()
