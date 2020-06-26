defmodule WebServer.Products do
  @products_server {:global, :products_server}
  def list_products(products_server \\ @products_server) do
    GenServer.call(products_server, :list_products)
  end

  def get_product!(id, products_server \\ @products_server) do
    GenServer.call(products_server, {:get_product, id})
  end

  def create_product(params, products_server \\ @products_server) do
    GenServer.call(products_server, {:create_product, params})
  end

  def update_product(product, params, products_server \\ @products_server) do
    GenServer.call(products_server, {:update_product, product, params})
  end

  def delete_product(product, products_server \\ @products_server) do
    GenServer.call(products_server, {:delete_product, product})
  end

  def change_product, do: change_product(@products_server)

  def change_product(products_server) when is_atom(products_server) do
    GenServer.call(products_server, :change_product)
  end

  def change_product(product, products_server \\ @products_server) do
    GenServer.call(products_server, {:change_product, product})
  end
end
