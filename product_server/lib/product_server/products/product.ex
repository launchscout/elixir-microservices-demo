defmodule ProductServer.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field(:sku, :string)
    field(:name, :string)
    field(:price_usd, :integer)
    field(:main_image_url, :string)

    timestamps()
  end

  def changeset(product, attrs) do
    product
    |> cast(attrs, [:sku, :name, :price_usd, :main_image_url])
    |> validate_required([:sku, :name, :price_usd])
    |> unique_constraint(:sku)
  end
end
