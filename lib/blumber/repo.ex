defmodule Blumber.Repo do
  use Ecto.Repo,
    otp_app: :blumber,
    adapter: Ecto.Adapters.Postgres
end
