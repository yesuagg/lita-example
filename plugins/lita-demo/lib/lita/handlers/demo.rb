module Lita
  module Handlers
    class Demo < Handler

      route(/ping/, :pong, command: true, help: { 'ping' => "replies with PONG" })
      on :connected, :availability
      http.get "/hello/:id", :http_get

      def pong(response)
        response.reply_privately "PONG"
      end

      def availability(payload)
        robot.send_messages("", "Lita is available for chat.")
      end

      def http_get(request, response)
        response.write("wishes for user with id: '#{request.env['router.params'][:id]}'")
      end

      Lita.register_handler(self)
    end
  end
end
