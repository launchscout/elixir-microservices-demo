defmodule WebServerWeb.ProductsTest do
  use WebServerWeb.FeatureCase, async: true

  alias WebServer.{AuthServerFake, Fixtures, ProductServerFake}
  alias WebServerWeb.ProductsPage
  @account_attrs Fixtures.account()

  setup do
    AuthServerFake.set_state(@account_attrs)
    sign_in_account(@account_attrs)
    {:ok, products: Fixtures.products(3)}
  end

  describe "products page" do
    test "show products page", %{products: products} do
      ProductServerFake.set_state(products)
      ProductsPage.visit_page()
      assert ProductsPage.has_products_count?(3)
      assert products |> hd() |> ProductsPage.has_product?()
    end
  end
end
