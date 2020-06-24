# ELixir Microservices Demo
This repo consists of three Elixir apps that implement a simple inventory
application using the microservices architecture. One server manages
authentication, another the products and the last the User Interface.

## Setup
In each of the subdirectories of this repo, run the following:
```sh
asdf install
mix deps.get
mix ecto.setup
```

In the web_server directory only:
```sh
cd assets && npm install
```

Finally, create this file `web_server/config/dev.secret.exs` with this content:
```elixir
use Mix.Config

config :web_server, WebServerWeb.Authentication,
  issuer: "web_server",
  secret_key: "replace-me-with-a-random-string"

config :web_server, WebServerWeb.Endpoint, server: true
```
And create this file `web_server/config/prod.secret.exs` with this content:
```elixir
use Mix.Config

config :web_server, WebServerWeb.Authentication,
  issuer: "web_server",
  secret_key: "replace-me-with-a-random-string"

config :web_server, WebServerWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: "replace-me-with-a-random-string"

config :web_server, WebServerWeb.Endpoint, server: true
```

## Demo
To run the demo, run the following in separate terminals:
```sh
cd auth_server
iex --name auth_server@127.0.0.1 -S mix
```
```sh
cd product_server
iex --name product_server@127.0.0.1 -S mix
```
```sh
cd web_server
iex --name web_server@127.0.0.1 -S mix phx.server
```
Once all apps are started: `open http://localhost:4000`
