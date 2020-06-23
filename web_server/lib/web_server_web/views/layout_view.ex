defmodule WebServerWeb.LayoutView do
  use WebServerWeb, :view

  def get_account(conn) do
    WebServerWeb.Authentication.get_current_account(conn)
  end
end
