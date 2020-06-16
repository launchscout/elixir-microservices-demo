defmodule ProductServer.Repo do
  use Ecto.Repo,
    otp_app: :product_server,
    adapter: Ecto.Adapters.Postgres
end
