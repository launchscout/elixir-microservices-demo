defmodule WebServerWeb.PageController do
  use WebServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
