module Lita
  module Handlers
    class DemoHTTP
      extend Lita::Handler::HTTPRouter

      http.get "/hello/*adjectives/world", :glob

      def glob(request, response)
        response.write(request.env["router.params"][:adjectives].join(", "))
      end

      Lita.register_handler(self)
    end
  end
end
