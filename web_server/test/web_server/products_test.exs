defmodule WebServer.ProductsTest do
  use WebServer.DataCase
  alias WebServer.{Fixtures, Products, ProductsRpc, ProductServerFake, ProductServerRpcFake}
  @product_attrs Fixtures.product()
  @product_server :"product_server@127.0.0.1"

  setup do
    {:ok, products: Fixtures.products(3)}
  end

  describe "using GenServer calls and globally registered name" do
    test "create_product/1" do
      ProductServerFake.set_state({:ok, @product_attrs})
      assert {:ok, @product_attrs} = Products.create_product(@product_attrs)
    end

    test "list_products/1", %{products: products} do
      ProductServerFake.set_state(products)
      assert products == Products.list_products()
    end
  end

  describe "using :rpc calls" do
    test "create_product/1" do
      :rpc.call(@product_server, ProductServerRpcFake, :set_state, [{:ok, @product_attrs}])

      assert {:ok, @product_attrs} =
               ProductsRpc.create_product(@product_attrs, ProductServerRpcFake)
    end

    test "list_products/1", %{products: products} do
      :rpc.call(@product_server, ProductServerRpcFake, :set_state, [products])
      assert products == ProductsRpc.list_products(ProductServerRpcFake)
    end
  end
end
