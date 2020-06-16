use Mix.Config

config :auth_server, AuthServer.Repo,
  username: "postgres",
  password: "postgres",
  database: "auth_server_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :yauth, :sql_sandbox, true
