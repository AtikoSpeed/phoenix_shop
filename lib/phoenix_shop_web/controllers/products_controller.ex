defmodule PhoenixShopWeb.ProductsController do
  use PhoenixShopWeb, :controller

  def index(conn, _params) do
    products = PhoenixShop.FakeStore.list_products()
    render(conn, :index, products: products)
  end
end
