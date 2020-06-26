defmodule WebServer.Accounts do
  @accounts_server {:global, :accounts_server}
  def get_or_register(%Ueberauth.Auth{} = params, accounts_server \\ @accounts_server) do
    GenServer.call(accounts_server, {:get_or_register, params})
  end

  def register(%Ueberauth.Auth{} = params, accounts_server \\ @accounts_server) do
    GenServer.call(accounts_server, {:register, params})
  end

  def get_account(id, accounts_server \\ @accounts_server) do
    GenServer.call(accounts_server, {:get_account, id})
  end

  def get_by_email(email, accounts_server \\ @accounts_server) do
    GenServer.call(accounts_server, {:get_by_email, email})
  end

  def change_account(accounts_server \\ @accounts_server) do
    GenServer.call(accounts_server, :change_account)
  end
end
