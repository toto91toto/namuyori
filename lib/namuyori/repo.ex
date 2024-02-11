defmodule Namuyori.Repo do
  use Ecto.Repo,
    otp_app: :namuyori,
    adapter: Ecto.Adapters.Postgres
end
