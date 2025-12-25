defmodule PhoenixShopWeb.Admin.ProductsHTML do
  use PhoenixShopWeb, :html

  def index(assigns) do
    ~H"""
    <ul>
      <li :for={product <- @products}>{product.title}</li>
    </ul>
    """
  end
end
