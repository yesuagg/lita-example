module Lita
  module Handlers
    class DemoTimer < Handler
      route(/after_timer/, :after_timer)
      route(/every_timer/, :every_timer)

      def after_timer(response)
        i = 0
        after(1) do |timer|
          response.reply("Hello, 1 seconds later!")
        end
      end

      def every_timer(response)
        i = 0
        every(1) do |timer|
          response.reply("This is your 1 second reminder!")
          timer.stop if i==2
          i += 1
        end
      end

      Lita.register_handler(self)
    end
  end
end
