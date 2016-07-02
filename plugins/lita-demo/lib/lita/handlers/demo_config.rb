module Lita
  module Handlers
    class DemoConfig < Handler
      config :github_user_api, default: "https://api.github.com/users/" do
        validate do |value|
          "must contain 'https'" unless value.match("https")
        end
      end

      route(/gitinfo/, :gitinfo, help: { 'gitinfo' => "replies with the github user info." })

      def gitinfo(response)
        user_info = parse(get("#{config.github_user_api}#{response.args[0]}"))
        user_info.each do |key, value|
          response.reply "#{key}: #{value}"
        end
      end

      private

      def get(url)
        Net::HTTP.get make_uri(url)
      end

      def parse(obj)
        MultiJson.load(obj)
      end

      def make_uri(url)
        URI(url)
      end

      Lita.register_handler(self)
    end
  end
end
