defmodule WebServer.ProductsRpc do
  @products_context ProductServer.Products
  def list_products(products_context \\ @products_context) do
    :rpc.call(:"product_server@127.0.0.1", products_context, :list_products, [])
  end

  def get_product!(id, products_context \\ @products_context) do
    :rpc.call(:"product_server@127.0.0.1", products_context, :get_product!, [id])
  end

  def create_product(params, products_context \\ @products_context) do
    :rpc.call(:"product_server@127.0.0.1", products_context, :create_product, [params])
  end

  def update_product(product, params, products_context \\ @products_context) do
    :rpc.call(:"product_server@127.0.0.1", products_context, :update_product, [product, params])
  end

  def delete_product(product, products_context \\ @products_context) do
    :rpc.call(:"product_server@127.0.0.1", products_context, :delete_product, [product])
  end

  def change_product, do: change_product(@products_context)

  def change_product(products_context) when is_atom(products_context) do
    :rpc.call(:"product_server@127.0.0.1", products_context, :change_product, [])
  end

  def change_product(product, products_context \\ @products_context) do
    :rpc.call(:"product_server@127.0.0.1", products_context, :change_product, [product])
  end
end
