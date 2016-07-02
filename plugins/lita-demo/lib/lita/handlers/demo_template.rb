module Lita
  module Handlers
    class DemoTemplate < Handler

      route(/wish/i, command: true) do |response|
        response.reply(render_template("hello", name: "Carl"))
      end

      route(/reverse/i, command: true) do |response|
        helper = Module.new do
          def reverse_name(first, last)
            "#{last}, #{first}"
          end
        end

        response.reply(render_template_with_helpers("reverse", [helper], first: "Carl", last: "Pug"))
      end

      Lita.register_handler(self)
    end
  end
end
