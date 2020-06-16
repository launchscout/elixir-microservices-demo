defmodule YauthWeb.Authentication.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :yauth,
    error_handler: YauthWeb.Authentication.ErrorHandler,
    module: YauthWeb.Authentication

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end
