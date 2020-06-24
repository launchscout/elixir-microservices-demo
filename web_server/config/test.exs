use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :web_server, WebServerWeb.Endpoint,
  http: [port: 4002],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :web_server, :accounts_server, WebServer.AuthServerRpcFake
config :web_server, :products_server, WebServer.ProductServerRpcFake
