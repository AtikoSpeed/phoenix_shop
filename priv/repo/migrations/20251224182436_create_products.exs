defmodule PhoenixShop.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :price, :float
      add :description, :text
      add :category, :string
      add :image, :string
      add :rating, :float
      add :rating_count, :integer
      add :user_id, references(:users, type: :binary_id, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:products, [:user_id])
  end
end
