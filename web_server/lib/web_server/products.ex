defmodule WebServer.Products do
  @products_server {:global, :products_server}
  def list_products do
    GenServer.call(@products_server, :list_products)
  end

  def get_product!(id) do
    GenServer.call(@products_server, {:get_product, id})
  end

  def create_product(params) do
    GenServer.call(@products_server, {:create_product, params})
  end

  def update_product(product, params) do
    GenServer.call(@products_server, {:update_product, product, params})
  end

  def delete_product(product) do
    GenServer.call(@products_server, {:delete_product, product})
  end

  def change_product do
    GenServer.call(@products_server, :change_product)
  end

  def change_product(product) do
    GenServer.call(@products_server, {:change_product, product})
  end
end
