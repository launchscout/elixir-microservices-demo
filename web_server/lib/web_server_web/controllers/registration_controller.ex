defmodule WebServerWeb.RegistrationController do
  use WebServerWeb, :controller
  plug Ueberauth
  alias WebServerWeb.Authentication
  @accounts_context Application.get_env(:web_server, :accounts_context, WebServer.Accounts)

  @spec new(Plug.Conn.t(), any) :: Plug.Conn.t()
  def new(conn, _) do
    if Authentication.get_current_account(conn) do
      redirect(conn, to: Routes.profile_path(conn, :show))
    else
      render(conn, :new,
        changeset: @accounts_context.change_account(),
        action: Routes.registration_path(conn, :create)
      )
    end
  end

  def create(%{assigns: %{ueberauth_auth: auth_params}} = conn, _params) do
    case @accounts_context.register(auth_params) do
      {:ok, account} ->
        conn
        |> Authentication.log_in(account)
        |> redirect(to: Routes.profile_path(conn, :show))

      {:error, changeset} ->
        render(conn, :new,
          changeset: changeset,
          action: Routes.registration_path(conn, :create)
        )
    end
  end
end
