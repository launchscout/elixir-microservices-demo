defmodule WebServerWeb.ProfileAccessTest do
  use WebServerWeb.FeatureCase, async: true

  test "Accessing a protected resource without logging in" do
    navigate_to("/profile")

    assert current_path() == "/login"
  end
end
