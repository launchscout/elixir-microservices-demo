defmodule WebServer.Session.RegistrationPage do
  use WebServer.Page

  @page_path "/registration"

  def is_current_path? do
    current_path() == @page_path
  end

  def enter_credentials(email) do
    fill_field({:css, ".qa_email"}, email)
    fill_field({:css, ".qa_password"}, "Password1")
    fill_field({:css, ".qa_password_confirmation"}, "Password1")
  end

  def submit do
    click({:css, ".qa_submit"})
  end
end
