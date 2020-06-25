defmodule WebServer.Fixtures do
  def account(index \\ 1) do
    %{
      __struct__: AuthServer.Accounts.Account,
      id: index,
      email: "account#{index}@example.com",
      password: "password",
      encrypted_password: Argon2.hash_pwd_salt("password")
    }
  end

  def accounts(count) do
    Enum.map(1..count, &account/1)
  end

  def product(index \\ 1) do
    %{
      __struct__: ProductServer.Products.Product,
      id: index,
      sku: "sku#{index}",
      name: "Product #{index}",
      price_usd: 3,
      main_image_url: ""
    }
  end

  def products(count) do
    Enum.map(1..count, &product/1)
  end
end
