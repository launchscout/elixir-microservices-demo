defmodule WebServer.ClusterTest do
  use WebServer.DataCase
  @auth_server :"auth_server@127.0.0.1"
  @product_server :"product_server@127.0.0.1"

  test "confirm node cluster" do
    assert [@auth_server, @product_server] == Node.list()
    assert :"web_server@127.0.0.1" == :erlang.node()
  end

  test "confirm that AuthServerFake and ProductServerFake GenServers are started with globally registered names" do
    assert [:accounts_server, :products_server] == :global.registered_names() |> Enum.sort()
  end

  test "confirm AuthServerRpcFake is only started on connected nodes" do
    assert nil == GenServer.whereis(:accounts_rpc_server)
    pid = :rpc.call(@auth_server, GenServer, :whereis, [:accounts_rpc_server])
    assert is_pid(pid)
  end

  test "confirm ProductServerRpcFake is only started on connected nodes" do
    assert nil == GenServer.whereis(:products_rpc_server)
    pid = :rpc.call(@product_server, GenServer, :whereis, [:products_rpc_server])
    assert is_pid(pid)
  end
end
