defmodule WebServer.AccountsRpc do
  @accounts_context AuthServer.Accounts
  def get_or_register(%Ueberauth.Auth{} = params, accounts_context \\ @accounts_context) do
    :rpc.call(:"auth_server@127.0.0.1", accounts_context, :get_or_register, [params])
  end

  def register(%Ueberauth.Auth{} = params, accounts_context \\ @accounts_context) do
    :rpc.call(:"auth_server@127.0.0.1", accounts_context, :register, [params])
  end

  def get_account(id, accounts_context \\ @accounts_context) do
    :rpc.call(:"auth_server@127.0.0.1", accounts_context, :get_account, [id])
  end

  def get_by_email(email, accounts_context \\ @accounts_context) do
    :rpc.call(:"auth_server@127.0.0.1", accounts_context, :get_by_email, [email])
  end

  def change_account(accounts_context \\ @accounts_context) do
    :rpc.call(:"auth_server@127.0.0.1", accounts_context, :change_account, [])
  end
end
