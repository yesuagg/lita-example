module Lita
  module Handlers
    class DemoRedis < Handler
      route(/^save{1}/, :save, command: true, help: { "save {user_id} {user_name}" => "save user_id to user_name mapping" })
      route(/^fetch{1}/, :fetch, command: true, help: { "fetch {user_id}" => "fetches username for given user id" })

      def save(response)
        user_id = response.args.first
        user_name = response.args.last
        redis.set(user_id, user_name)
        response.reply "saved!"
      end

      def fetch(response)
        user_name = redis.get(response.args.first)

        if user_name.nil?
          response.reply "Not found!"
        else
          response.reply user_name
        end
      end
      Lita.register_handler(self)
    end
  end
end
