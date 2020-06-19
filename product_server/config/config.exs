use Mix.Config

config :product_server,
  ecto_repos: [ProductServer.Repo]

import_config "#{Mix.env()}.exs"
