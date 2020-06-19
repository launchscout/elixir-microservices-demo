defmodule WebServer.ProductServerFake do
  use GenServer
  @response {:ok, %{}}

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: {:global, :products_server})
  end

  # Callbacks

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(_, _from, state) do
    {:reply, state, state}
  end
end
