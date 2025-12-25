defmodule PhoenixShop.Store.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :title, :string
    field :price, :float
    field :description, :string
    field :category, :string
    field :image, :string
    field :rating, :float
    field :rating_count, :integer
    field :user_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs, user_scope) do
    product
    |> cast(attrs, [:title, :price, :description, :category, :image, :rating, :rating_count])
    |> validate_required([
      :title,
      :price,
      :description,
      :category,
      :image,
      :rating,
      :rating_count
    ])
    |> put_change(:user_id, user_scope.user.id)
  end
end
