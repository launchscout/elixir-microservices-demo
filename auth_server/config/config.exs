use Mix.Config

config :auth_server,
  ecto_repos: [AuthServer.Repo]

import_config "#{Mix.env()}.exs"
