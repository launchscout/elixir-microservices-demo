# defmodule WebServerWeb.Features.RegisteringForAnAccountTest do
#   use WebServerWeb.FeatureCase, async: true
#   import Query, only: [fillable_field: 1, button: 1]
#
#   @email_field fillable_field("account[email]")
#   @password_field fillable_field("account[password]")
#   @password_confirmation_field fillable_field("account[password_confirmation]")
#   @submit_button button("Register")
#
#   test "Registering for an account with valid info", %{session: session} do
#     session =
#       session
#       |> visit("/register")
#       |> fill_in(@email_field, with: "me@example.com")
#       |> fill_in(@password_field, with: "superdupersecret")
#       |> fill_in(@password_confirmation_field, with: "superdupersecret")
#       |> click(@submit_button)
#
#     assert_text(session, "Hello, me@example.com")
#   end
# end
