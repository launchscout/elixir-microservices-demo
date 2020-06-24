defmodule WebServer.ProductsTest do
  use WebServer.DataCase
  alias WebServer.{Fixtures, Products, ProductsRpc, ProductServerFake, ProductServerRpcFake}
  @product_attrs Fixtures.product()
  @product_server :"product_server@127.0.0.1"

  setup do
    {:ok, products: Enum.map(1..3, &Fixtures.product/1)}
  end

  describe "using GenServer calls and globally registered name" do
    test "list_products/1", %{products: products} do
      ProductServerFake.set_state(products)
      assert products == Products.list_products()
    end
  end

  describe "using :rpc calls" do
    test "list_products/1", %{products: products} do
      :rpc.call(@product_server, ProductServerRpcFake, :set_state, [products])
      assert products == ProductsRpc.list_products()
    end
  end
end
