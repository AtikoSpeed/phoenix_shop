defmodule PhoenixShopWeb.Admin.ProductsController do
  use PhoenixShopWeb, :controller

  def index(conn, _params) do
    products = PhoenixShop.Store.list_products()
    render(conn, :index, products: products)
  end
end
