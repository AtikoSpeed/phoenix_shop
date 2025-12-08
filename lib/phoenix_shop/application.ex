defmodule PhoenixShop.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixShopWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:phoenix_shop, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixShop.PubSub},
      # Start a worker by calling: PhoenixShop.Worker.start_link(arg)
      # {PhoenixShop.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixShopWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixShop.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixShopWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
