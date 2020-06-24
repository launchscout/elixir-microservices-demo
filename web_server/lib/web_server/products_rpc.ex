defmodule WebServer.ProductsRpc do
  @products_context Application.get_env(:web_server, :products_server, ProductServer.Products)
  def list_products do
    :rpc.call(:"product_server@127.0.0.1", @products_context, :list_products, [])
  end

  def get_product!(id) do
    :rpc.call(:"product_server@127.0.0.1", @products_context, :get_product!, [id])
  end

  def create_product(params) do
    :rpc.call(:"product_server@127.0.0.1", @products_context, :create_product, [params])
  end

  def update_product(product, params) do
    :rpc.call(:"product_server@127.0.0.1", @products_context, :update_product, [product, params])
  end

  def delete_product(product) do
    :rpc.call(:"product_server@127.0.0.1", @products_context, :delete_product, [product])
  end

  def change_product do
    :rpc.call(:"product_server@127.0.0.1", @products_context, :change_product, [])
  end

  def change_product(product) do
    :rpc.call(:"product_server@127.0.0.1", @products_context, :change_product, [product])
  end
end
