defmodule PutFlash.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PutFlashWeb.Telemetry,
      PutFlash.Repo,
      {DNSCluster, query: Application.get_env(:put_flash, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PutFlash.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PutFlash.Finch},
      # Start a worker by calling: PutFlash.Worker.start_link(arg)
      # {PutFlash.Worker, arg},
      # Start to serve requests, typically the last entry
      PutFlashWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PutFlash.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PutFlashWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
