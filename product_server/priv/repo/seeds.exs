attrs_list = [
  %{sku: "sku1", name: "sooper cool thing", price_usd: 15},
  %{sku: "sku2", name: "less cool thing", price_usd: 10},
  %{sku: "sku3", name: "sooper dumb thing", price_usd: 5}
]

Enum.each(attrs_list, &ProductServer.Products.create_product/1)
