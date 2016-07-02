module Lita
  module Handlers
    class DemoEvent
      extend Lita::Handler::EventRouter

      on :connected, :greet

      def greet(payload)
        robot.send_messages("", "Welcome User!")
      end

      Lita.register_handler(self)
    end
  end
end
