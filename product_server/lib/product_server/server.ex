defmodule ProductServer.Server do
  use GenServer
  alias ProductServer.Products

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: {:global, :products_server})
  end

  # Callbacks

  @impl true
  def init(_) do
    {:ok, []}
  end

  @impl true
  def handle_call(:list_products, _from, state) do
    {:reply, Products.list_products(), state}
  end

  @impl true
  def handle_call({:get_product, id}, _from, state) do
    {:reply, Products.get_product!(id), state}
  end

  @impl true
  def handle_call({:create_product, params}, _from, state) do
    {:reply, Products.create_product(params), state}
  end

  @impl true
  def handle_call({:update_product, product, params}, _from, state) do
    {:reply, Products.update_product(product, params), state}
  end

  @impl true
  def handle_call({:delete_product, product}, _from, state) do
    {:reply, Products.delete_product(product), state}
  end

  @impl true
  def handle_call(:change_product, _from, state) do
    {:reply, Products.change_product(), state}
  end
end
