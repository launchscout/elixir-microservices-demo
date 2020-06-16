defmodule Yauth.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      YauthWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Yauth.PubSub},
      # Start the Endpoint (http/https)
      YauthWeb.Endpoint,
      # Start a worker by calling: Yauth.Worker.start_link(arg)
      # {Yauth.Worker, arg}
      {Task.Supervisor, name: Yauth.TaskSupervisor}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Yauth.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    YauthWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
