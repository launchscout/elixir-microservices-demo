defmodule YauthWeb.ProfileController do
  use YauthWeb, :controller
  alias YauthWeb.Authentication

  def show(conn, _params) do
    current_account = Authentication.get_current_account(conn)
    render(conn, :show, current_account: current_account)
  end
end
