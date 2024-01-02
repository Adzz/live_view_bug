defmodule Bugs.Repo do
  use Ecto.Repo,
    otp_app: :bugs,
    adapter: Ecto.Adapters.Postgres
end
