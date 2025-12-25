defmodule PhoenixShop.Store do
  alias PhoenixShop.Repo
  alias PhoenixShop.Store.Product

  def list_products do
    Repo.all(Product)
  end
end
