defmodule Namuyori.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NamuyoriWeb.Telemetry,
      Namuyori.Repo,
      {DNSCluster, query: Application.get_env(:namuyori, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Namuyori.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Namuyori.Finch},
      # Start a worker by calling: Namuyori.Worker.start_link(arg)
      # {Namuyori.Worker, arg},
      # Start to serve requests, typically the last entry
      NamuyoriWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Namuyori.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NamuyoriWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
