defmodule PhoenixPubsubRedis.Mixfile do
  use Mix.Project

  @version "3.0.0-dev"

  def project do
    [
      app: :phoenix_pubsub_redis,
      version: @version,
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      source_url: "https://github.com/phoenixframework/phoenix_pubsub_redis",
      description: "The Redis PubSub adapter for the Phoenix framework"
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      phoenix_pubsub(),
      {:redix, "~> 0.9.0"},
      {:ex_doc, "~> 0.19.0", only: :docs},
      {:poolboy, "~> 1.5.1 or ~> 1.6"}
    ]
  end

  defp phoenix_pubsub do
    if path = System.get_env("PUBSUB_PATH") do
      {:phoenix_pubsub, "~> 2.0-dev", path: path}
    else
      {:phoenix_pubsub, "~> 2.0-dev", github: "phoenixframework/phoenix_pubsub"}
    end
  end

  defp package do
    [
      maintainers: ["Chris McCord"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/phoenixframework/phoenix_pubsub_redis"}
    ]
  end
end
