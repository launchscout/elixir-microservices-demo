defmodule WebServer.AccountsTest do
  use WebServer.DataCase
  alias WebServer.Accounts

  test "regitster/1" do
    assert {:ok, %{email: "account@email.com"}} = Accounts.register(valid_account_params())
  end

  defp valid_account_params do
    %Ueberauth.Auth{
      credentials: %Ueberauth.Auth.Credentials{
        other: %{
          password: "superdupersecret",
          password_confirmation: "superdupersecret"
        }
      },
      info: %Ueberauth.Auth.Info{
        email: "account@email.com"
      }
    }
  end
end
