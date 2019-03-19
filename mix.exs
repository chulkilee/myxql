defmodule MyXQL.MixProject do
  use Mix.Project

  @version "0.2.0"
  @source_url "https://github.com/elixir-ecto/myxql"

  def project() do
    [
      app: :myxql,
      version: @version,
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      description: "MySQL 5.7+ driver for Elixir",
      source_url: @source_url,
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  def application() do
    [
      extra_applications: [:logger, :crypto]
    ]
  end

  defp package() do
    [
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs() do
    [
      source_ref: "v#{@version}",
      main: "readme",
      extras: ["README.md"]
    ]
  end

  defp deps() do
    [
      {:db_connection, "~> 2.0", db_connection_opts()},
      {:decimal, "~> 1.6"},
      {:jason, "~> 1.0", optional: true},
      {:binpp, ">= 0.0.0", only: [:dev, :test]},
      {:dialyxir, "~> 1.0-rc", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:benchee, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp db_connection_opts() do
    if path = System.get_env("DB_CONNECTION_PATH") do
      [path: path]
    else
      []
    end
  end
end
