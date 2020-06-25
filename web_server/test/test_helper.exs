:ok = WebServer.LocalCluster.start(:web_server)
WebServer.LocalCluster.start_nodes([:auth_server, :product_server])

{:ok, _} = Application.ensure_all_started(:hound)
ExUnit.start()
