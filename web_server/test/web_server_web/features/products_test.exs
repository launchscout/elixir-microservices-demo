defmodule WebServerWeb.ProductsTest do
  use WebServerWeb.FeatureCase, async: true

  alias WebServer.Fixtures
  alias WebServerWeb.ProductsPage

  setup do
    {:ok, products: Enum.map(1..3, &Fixtures.product/1)}
  end

  describe "products page" do
    test "show products page", %{session: session, products: products} do
      session
      |> ProductsPage.visit_page()
      |> assert_has(ProductsPage.products(3))
      |> assert_has(products |> hd() |> ProductsPage.product())
    end
  end
end
