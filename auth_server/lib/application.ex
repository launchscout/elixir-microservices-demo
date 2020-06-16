defmodule AuthServer.Application do
  use Application

  def start(_type, _args) do
    children = [
      AuthServer.Accounts,
      AuthServer.Repo,
      {Task.Supervisor, name: AuthServer.TaskSupervisor}
    ]

    opts = [strategy: :one_for_one, name: AuthServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
