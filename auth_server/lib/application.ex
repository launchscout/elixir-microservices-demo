defmodule AuthServer.Application do
  use Application

  def start(_type, _args) do
    children = [
      AuthServer.Server,
      AuthServer.Repo,
      {Task.Supervisor, name: AuthServer.TaskSupervisor}
    ]

    opts = [strategy: :one_for_one, name: AuthServer.Supervisor]
    result = Supervisor.start_link(children, opts)

    Node.connect(:"web_server@127.0.0.1")
    Node.connect(:"product_server@127.0.0.1")

    result
  end
end
