defmodule PhoenixShopWeb.Admin.UserHTML do
  use PhoenixShopWeb, :html

  def index(assigns) do
    ~H"""
    <ul>
      <li :for={user <- @users}>{user.first_name} {user.last_name} {user.email}</li>
    </ul>
    """
  end
end
