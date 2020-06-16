defmodule Yauth.Accounts do
  @accounts_server {:global, :accounts_server}
  def get_or_register(%Ueberauth.Auth{} = params) do
    GenServer.call(@accounts_server, {:get_or_register, params})
  end

  def register(%Ueberauth.Auth{} = params) do
    GenServer.call(@accounts_server, {:register, params})
  end

  def get_account(id) do
    GenServer.call(@accounts_server, {:get_account, id})
  end

  def get_by_email(email) do
    GenServer.call(@accounts_server, {:get_by_email, email})
  end

  def change_account() do
    GenServer.call(@accounts_server, :get_account_cset)
  end
end
