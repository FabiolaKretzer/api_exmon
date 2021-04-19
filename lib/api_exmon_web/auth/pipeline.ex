defmodule ApiExmonWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :api_exmon

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource

end
