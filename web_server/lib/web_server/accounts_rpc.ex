defmodule WebServer.AccountsRpc do
  @accounts_context Application.get_env(:web_server, :accounts_server, AuthServer.Accounts)
  def get_or_register(%Ueberauth.Auth{} = params) do
    :rpc.call(:"auth_server@127.0.0.1", @accounts_context, :get_or_register, [params])
  end

  def register(%Ueberauth.Auth{} = params) do
    :rpc.call(:"auth_server@127.0.0.1", @accounts_context, :register, [params])
  end

  def get_account(id) do
    :rpc.call(:"auth_server@127.0.0.1", @accounts_context, :get_account, [id])
  end

  def get_by_email(email) do
    :rpc.call(:"auth_server@127.0.0.1", @accounts_context, :get_by_email, [email])
  end

  def change_account do
    :rpc.call(:"auth_server@127.0.0.1", @accounts_context, :change_account, [])
  end
end
