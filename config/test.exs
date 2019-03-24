use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :append, AppendWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :append, Append.Repo,
  username: "append_only",
  password: "postgres",
  database: "append_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
