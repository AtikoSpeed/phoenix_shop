defmodule PhoenixShop.StoreTest do
  use PhoenixShop.DataCase

  alias PhoenixShop.Store
  alias PhoenixShop.Store.Product
  alias PhoenixShop.Accounts.Scope

  import PhoenixShop.AccountsFixtures

  describe "Product schema" do
    test "has all required fields" do
      product = %Product{}

      assert Map.has_key?(product, :id)
      assert Map.has_key?(product, :title)
      assert Map.has_key?(product, :price)
      assert Map.has_key?(product, :description)
      assert Map.has_key?(product, :category)
      assert Map.has_key?(product, :image)
      assert Map.has_key?(product, :rating)
      assert Map.has_key?(product, :rating_count)
      assert Map.has_key?(product, :user_id)
      assert Map.has_key?(product, :inserted_at)
      assert Map.has_key?(product, :updated_at)
    end

    test "persists all fields to database" do
      user = user_fixture()
      scope = Scope.for_user(user)

      attrs = %{
        title: "Test Product",
        price: Decimal.new("29.99"),
        description: "A test product description",
        category: "Electronics",
        image: "https://example.com/image.jpg",
        rating: 4.5,
        rating_count: 100
      }

      {:ok, product} =
        %Product{}
        |> Product.changeset(attrs, scope)
        |> Repo.insert()

      db_product = Repo.get!(Product, product.id)

      assert db_product.title == "Test Product"
      assert db_product.price == Decimal.new("29.99")
      assert db_product.description == "A test product description"
      assert db_product.category == "Electronics"
      assert db_product.image == "https://example.com/image.jpg"
      assert db_product.rating == 4.5
      assert db_product.rating_count == 100
      assert db_product.user_id == user.id
    end

    test "changeset validates required fields" do
      user = user_fixture()
      scope = Scope.for_user(user)

      changeset = Product.changeset(%Product{}, %{}, scope)

      refute changeset.valid?
      assert "can't be blank" in errors_on(changeset).title
      assert "can't be blank" in errors_on(changeset).price
      assert "can't be blank" in errors_on(changeset).description
      assert "can't be blank" in errors_on(changeset).category
      assert "can't be blank" in errors_on(changeset).image
      assert "can't be blank" in errors_on(changeset).rating
      assert "can't be blank" in errors_on(changeset).rating_count
    end
  end

  describe "list_products/0" do
    test "returns all products including newly created ones" do
      initial_count = length(Store.list_products())

      user = user_fixture()
      scope = Scope.for_user(user)

      {:ok, product} =
        %Product{}
        |> Product.changeset(%{
          title: "Test",
          price: Decimal.new("10.00"),
          description: "Desc",
          category: "Cat",
          image: "img.jpg",
          rating: 5.0,
          rating_count: 1
        }, scope)
        |> Repo.insert()

      products = Store.list_products()
      assert length(products) == initial_count + 1
      assert Enum.any?(products, fn p -> p.id == product.id end)
    end
  end
end
