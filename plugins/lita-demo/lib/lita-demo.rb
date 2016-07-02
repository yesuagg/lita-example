require "lita"

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require "lita/handlers/demo"
require "lita/handlers/demo_chat"
require "lita/handlers/demo_event"
require "lita/handlers/demo_http"
require "lita/handlers/demo_config"
require "lita/handlers/demo_timer"
require "lita/handlers/demo_redis"
require "lita/handlers/demo_template"

Lita::Handlers::DemoTemplate.template_root File.expand_path(
                                         File.join("..", "..", "templates"),
                                         __FILE__
                                       )
