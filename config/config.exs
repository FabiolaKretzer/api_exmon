# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :api_exmon,
  ecto_repos: [ApiExmon.Repo]

# Configures the endpoint
config :api_exmon, ApiExmonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m4KJO1ysnHJW9P53bd2q4N3HPp6HDjP/32GioI1sJe1AIe2qQ9oIogfFVXUQUr/k",
  render_errors: [view: ApiExmonWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ApiExmon.PubSub,
  live_view: [signing_salt: "h782plSQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :api_exmon, ApiExmonWeb.Auth.Guardian,
       issuer: "api_exmon",
       secret_key: "XA6OJc4Xsc/7ClX6i60ozdIYTnrJIpMRdoKg0kDJsk00zV2nH4j3yJKSJS+kIRH5"

config :api_exmon, ApiExmonWeb.Auth.Pipeline,
       module: ApiExmonWeb.Auth.Guardian,
       error_handler: ApiExmonWeb.Auth.ErrorHandler
