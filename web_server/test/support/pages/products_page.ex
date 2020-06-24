defmodule WebServerWeb.ProductsPage do
  @moduledoc false

  use Wallaby.DSL

  import Wallaby.Query, only: [css: 1, css: 2]

  def visit_page(session) do
    visit(session, "/products")
  end

  def product(%{sku: product_sku}) do
    css("[data-product-sku='#{product_sku}']")
  end

  def products(count) do
    css("[data-selector='product']", count: count)
  end
end
