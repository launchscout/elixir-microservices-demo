defmodule WebServer.AccountsTest do
  use WebServer.DataCase
  alias WebServer.{Accounts, AccountsRpc, AuthServerFake, AuthServerRpcFake, Fixtures}
  @account_attrs Fixtures.account()
  @auth_server :"auth_server@127.0.0.1"

  describe "using GenServer calls and globally registered name" do
    test "change_account/1" do
      AuthServerFake.set_state(%{__struct__: Ecto.Changset})
      assert %{__struct__: Ecto.Changset} = Accounts.change_account()
    end

    test "register/1" do
      AuthServerFake.set_state({:ok, @account_attrs})
      assert {:ok, @account_attrs} = Accounts.register(valid_account_params())
    end
  end

  describe "using :rpc calls" do
    test "change_account/1" do
      :rpc.call(@auth_server, AuthServerRpcFake, :set_state, [%{__struct__: Ecto.Changset}])
      assert %{__struct__: Ecto.Changset} = AccountsRpc.change_account()
    end

    test "register/1" do
      :rpc.call(@auth_server, AuthServerRpcFake, :set_state, [{:ok, @account_attrs}])
      assert {:ok, @account_attrs} = AccountsRpc.register(valid_account_params())
    end
  end

  defp valid_account_params do
    %Ueberauth.Auth{
      credentials: %Ueberauth.Auth.Credentials{
        other: %{
          password: "superdupersecret",
          password_confirmation: "superdupersecret"
        }
      },
      info: %Ueberauth.Auth.Info{email: @account_attrs.email}
    }
  end
end
