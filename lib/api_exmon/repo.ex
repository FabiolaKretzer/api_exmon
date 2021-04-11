defmodule ApiExmon.Repo do
  use Ecto.Repo,
    otp_app: :api_exmon,
    adapter: Ecto.Adapters.Postgres
end
