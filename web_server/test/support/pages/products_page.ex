defmodule WebServerWeb.ProductsPage do
  @moduledoc false
  use WebServer.Page

  def visit_page() do
    navigate_to("/products")
  end

  def has_product?(%{sku: product_sku}) do
    has_css?("[data-product-sku='#{product_sku}']")
  end

  def has_products_count?(count) do
    find_all_elements(:css, "[data-selector='product']") |> length() |> Kernel.==(count)
  end
end
