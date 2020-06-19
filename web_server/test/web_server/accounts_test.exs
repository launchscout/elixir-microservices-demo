defmodule WebServer.AccountsTest do
  use WebServer.DataCase
  alias WebServer.{Accounts, LocalCluster}
  @response {:ok, %{email: "account@email.com"}}

  test "spawning tasks on a cluster" do
    :ok = LocalCluster.start(:web_server)

    [auth_server, product_server] =
      LocalCluster.start_nodes([:auth_server, :product_server],
        auth_server: @response,
        product_server: %{}
      )

    assert Node.ping(auth_server) == :pong
    assert Node.ping(product_server) == :pong

    caller = self()

    # WebServer.AuthServerFake.start_link(@response) |> IO.inspect()

    # Node.spawn(auth_server, WebServer.AuthServerFake, :start_link, [@response])

    # Node.spawn(auth_server, fn ->
    #   DynamicSupervisor.start_child(
    #     WebServer.DynamicSupervisor,
    #     {WebServer.AuthServerFake, fn -> @response end}
    #   )
    # end)

    #
    # Node.spawn(product_server, fn ->
    #   send(caller, :from_node_2)
    # end)
    #
    # assert_receive :from_node_1
    # assert_receive :from_node_2
    assert {:ok, %{email: "account@email.com"}} = Accounts.register(valid_account_params())
  end

  # test "register for an account with valid information" do
  #   IO.inspect(:global.registered_names())
  #   params = valid_account_params()
  #
  #   assert {:ok, %{email: "account@email.com"}} = Accounts.register(params)
  # end

  defp valid_account_params do
    %Ueberauth.Auth{
      credentials: %Ueberauth.Auth.Credentials{
        other: %{
          password: "superdupersecret",
          password_confirmation: "superdupersecret"
        }
      },
      info: %Ueberauth.Auth.Info{
        email: "me@example.com"
      }
    }
  end
end
