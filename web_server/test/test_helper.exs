:ok = WebServer.LocalCluster.start(:web_server)

WebServer.LocalCluster.start_nodes([:auth_server, :product_server],
  auth_server: {:ok, WebServer.Fixtures.account()},
  product_server: {:ok, WebServer.Fixtures.product()}
)

ExUnit.start()
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, WebServerWeb.Endpoint.url())
