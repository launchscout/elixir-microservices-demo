defmodule WebServerWeb.ProfileController do
  use WebServerWeb, :controller
  alias WebServerWeb.Authentication

  def show(conn, _params) do
    current_account = Authentication.get_current_account(conn)
    render(conn, :show, current_account: current_account)
  end
end
