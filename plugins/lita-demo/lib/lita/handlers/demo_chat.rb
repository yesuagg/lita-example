module Lita
  module Handlers
    class DemoChat
      extend Lita::Handler::ChatRouter

      route(/hi/, :hello, help: { 'hi' => "replies with Hello!" })

      def hello(response)
        response.reply "Hello!"
      end

      Lita.register_handler(self)
    end
  end
end
