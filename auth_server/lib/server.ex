defmodule AuthServer.Server do
  use GenServer
  alias AuthServer.Accounts

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: {:global, :accounts_server})
  end

  # Callbacks

  @impl true
  def init(_) do
    {:ok, []}
  end

  @impl true
  def handle_call({:get_or_register, params}, _from, state) do
    {:reply, Accounts.get_or_register(params), state}
  end

  @impl true
  def handle_call({:register, params}, _from, state) do
    {:reply, Accounts.register(params), state}
  end

  @impl true
  def handle_call({:get_account, id}, _from, state) do
    {:reply, Accounts.get_account(id), state}
  end

  @impl true
  def handle_call({:get_by_email, email}, _from, state) do
    {:reply, Accounts.get_by_email(email), state}
  end

  @impl true
  def handle_call(:change_account, _from, state) do
    {:reply, Accounts.change_account(), state}
  end
end
