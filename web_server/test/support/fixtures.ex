defmodule WebServer.Fixtures do
  def account(email \\ "account@example.com") do
    %{
      email: email,
      password: "password"
    }
  end

  def product(sku \\ "sku1") do
    %{
      sku: sku,
      name: "Product for #{sku}",
      price_usd: 3
    }
  end
end
