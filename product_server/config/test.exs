use Mix.Config

config :product_server, ProductServer.Repo,
  username: "postgres",
  password: "postgres",
  database: "auth_server_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :product_server, :sql_sandbox, true
