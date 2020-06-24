defmodule WebServer.AuthServerFake do
  use GenServer
  @server_name {:global, :accounts_server}

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: @server_name)
  end

  def set_state(state) do
    GenServer.cast(@server_name, {:set_state, state})
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

  @impl true
  def handle_cast({:set_state, new_state}, _state) do
    {:noreply, new_state}
  end
end
