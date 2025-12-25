defmodule PhoenixShopWeb.Admin.DashboardController do
  use PhoenixShopWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
