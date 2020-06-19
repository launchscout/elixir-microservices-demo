defmodule WebServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WebServerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: WebServer.PubSub},
      # Start the Endpoint (http/https)
      WebServerWeb.Endpoint,
      # Start a worker by calling: WebServer.Worker.start_link(arg)
      # {WebServer.Worker, arg}
      {Task.Supervisor, name: WebServer.TaskSupervisor}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebServer.Supervisor]
    result = Supervisor.start_link(children, opts)

    Node.connect(:"auth_server@127.0.0.1")
    Node.connect(:"product_server@127.0.0.1")

    result
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WebServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
