# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :auth_example,
  ecto_repos: [AuthExample.Repo]

# Configures the endpoint
config :auth_example, AuthExample.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mXEQh/4yhxL92pL/aB5nXCYvK7z5CFInV5JnBtpLWDdGxrywHc69KTspvFWe7OgG",
  render_errors: [view: AuthExample.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuthExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures guardian plugin
config :guardian, Guardian,
  issuer: "AuthExample",
  ttl: { 30, :days },
  allowed_drift: 2000,
  secret_key: "SOME_SECRET_WE_NEED_TO_CHANGE",
  serializer: AuthExample.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
