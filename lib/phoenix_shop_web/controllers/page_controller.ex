defmodule PhoenixShopWeb.PageController do
  use PhoenixShopWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
