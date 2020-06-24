defmodule WebServer.ProductServerRpcFake do
  use GenServer
  @server_name :products_rpc_server

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: @server_name)
  end

  def set_state(state) do
    GenServer.cast(@server_name, {:set_state, state})
  end

  # RPC method calls

  def list_products, do: GenServer.call(@server_name, :get_state)
  def get_product!(_id), do: GenServer.call(@server_name, :get_state)
  def create_product(_params), do: GenServer.call(@server_name, :get_state)
  def update_product(_product, _params), do: GenServer.call(@server_name, :get_state)
  def delete_product(_product), do: GenServer.call(@server_name, :get_state)
  def change_product, do: GenServer.call(@server_name, :get_state)
  def change_product(_product), do: GenServer.call(@server_name, :get_state)

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
