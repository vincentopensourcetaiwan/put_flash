defmodule PutFlash.Repo do
  use Ecto.Repo,
    otp_app: :put_flash,
    adapter: Ecto.Adapters.Postgres
end
