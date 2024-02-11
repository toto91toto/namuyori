import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :namuyori, Namuyori.Repo,
  username: "postgres",
  password: "root",
  hostname: "localhost",
  database: "namuyori_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :namuyori, NamuyoriWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "md5RZP46iMcvaA/S3JNgJwz4qfCRoDOHM6nMLJ/LPTCf6JFamVWEgAfnSGgxCGW8",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
