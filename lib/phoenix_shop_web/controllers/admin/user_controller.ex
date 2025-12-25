defmodule PhoenixShopWeb.Admin.UserController do
  use PhoenixShopWeb, :controller

  def index(conn, _params) do
    users = PhoenixShop.Accounts.list_users()
    render(conn, :index, users: users)
  end
end
