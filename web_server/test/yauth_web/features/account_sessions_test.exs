defmodule YauthWeb.AccountSessionsTest do
  use YauthWeb.FeatureCase

  import Wallaby.Query, only: [fillable_field: 1, button: 1, link: 1]
  alias Yauth.Accounts.Account
  alias Yauth.Repo

  @email_field fillable_field("account[email]")
  @password_field fillable_field("account[password]")
  @submit_button button("Log In")
  @log_out_link link("Log Out")

  setup do
    account =
      %Account{}
      |> Account.changeset(%{
        "email" => "me@example.com",
        "password" => "superdupersecret",
        "password_confirmation" => "superdupersecret"
      })
      |> Repo.insert!()

    {:ok, account: account}
  end

  test "Log in and out of an existing account", %{session: session, account: account} do
    session
    |> visit("/login")
    |> fill_in(@email_field, with: account.email)
    |> fill_in(@password_field, with: "superdupersecret")
    |> click(@submit_button)

    assert_text(session, "Hello, #{account.email}")

    click(session, @log_out_link)

    assert current_path(session) == "/login"
  end

  test "Log in with the wrong email and password", %{session: session, account: account} do
    session
    |> visit("/login")
    |> fill_in(@email_field, with: account.email)
    |> fill_in(@password_field, with: "thisisnotmypassword")
    |> click(@submit_button)

    assert_text(session, "Incorrect email or password")

    session
    |> visit("/login")
    |> fill_in(@email_field, with: "notmyemail@example.com")
    |> fill_in(@password_field, with: "superdupersecret")
    |> click(@submit_button)

    assert_text(session, "Incorrect email or password")
  end

  test "Visit log in when already logged in", %{session: session, account: account} do
    session
    |> visit("/login")
    |> fill_in(@email_field, with: account.email)
    |> fill_in(@password_field, with: "superdupersecret")
    |> click(@submit_button)

    visit(session, "/login")

    assert current_path(session) == "/profile"
  end

  test "Accessing a protected resource without logging in", %{session: session} do
    visit(session, "/profile")

    assert current_path(session) == "/login"
  end
end
