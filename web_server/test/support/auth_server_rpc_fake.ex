defmodule WebServer.AuthServerRpcFake do
  use GenServer
  @server_name :accounts_rpc_server

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: @server_name)
  end

  def set_state(state) do
    GenServer.cast(@server_name, {:set_state, state})
  end

  # RPC method calls

  def get_or_register(%Ueberauth.Auth{} = params), do: GenServer.call(@server_name, :get_state)
  def register(%Ueberauth.Auth{} = params), do: GenServer.call(@server_name, :get_state)
  def get_account(id), do: GenServer.call(@server_name, :get_state)
  def get_by_email(email), do: GenServer.call(@server_name, :get_state)
  def change_account, do: GenServer.call(@server_name, :get_state)

  # Callbacks

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(_, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:set_state, new_state}, _state) do
    {:noreply, new_state}
  end
end
