defmodule PhoenixShop.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_shop,
    adapter: Ecto.Adapters.Postgres
end
