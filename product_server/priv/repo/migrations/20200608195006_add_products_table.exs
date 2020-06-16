defmodule ProductServer.Repo.Migrations.AddProductsTable do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :sku, :string
      add :name, :string
      add :price_usd, :integer
      add :main_image_url, :string

      timestamps()
    end

    create unique_index(:products, [:sku])
  end
end
