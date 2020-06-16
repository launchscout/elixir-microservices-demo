use Mix.Config

config :auth_server, AuthServer.Repo,
  username: "postgres",
  password: "postgres",
  database: "auth_server_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
