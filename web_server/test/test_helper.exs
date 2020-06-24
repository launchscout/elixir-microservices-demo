:ok = WebServer.LocalCluster.start(:web_server)
WebServer.LocalCluster.start_nodes([:auth_server, :product_server])

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(WebServer.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, WebServerWeb.Endpoint.url())
