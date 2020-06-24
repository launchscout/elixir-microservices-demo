defmodule WebServer.AccountsTest do
  use WebServer.DataCase
  alias WebServer.{Accounts, AccountsRpc, AuthServerFake, AuthServerRpcFake}
  @account_attrs %Ueberauth.Auth.Info{email: "account@email.com"}

  describe "using GenServer calls and globally registered name" do
    setup do
      AuthServerFake.set_state({:ok, @account_attrs})
      :ok
    end

    test "register/1" do
      assert {:ok, @account_attrs} = Accounts.register(valid_account_params())
    end
  end

  describe "using :rpc calls" do
    setup do
      :rpc.call(:"auth_server@127.0.0.1", AuthServerRpcFake, :set_state, [{:ok, @account_attrs}])
      :ok
    end

    test "register/1" do
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
      info: @account_attrs
    }
  end
end
