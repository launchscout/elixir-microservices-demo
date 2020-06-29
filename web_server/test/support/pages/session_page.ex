defmodule WebServer.SessionPage do
  use WebServer.Page

  @page_path "/login"

  def visit do
    navigate_to(@page_path)
  end

  def is_current_path? do
    current_path() == @page_path
  end

  def visible_text do
    visible_page_text()
  end

  def enter_credentials(email, password) do
    fill_field({:class, "qa_session_email"}, email)
    fill_field({:class, "qa_session_password"}, password)
  end

  def submit do
    click({:class, "qa_session_submit"})
  end

  def sign_out do
    find_element(:class, "qa_sign_out") |> click()
  end

  def register do
    click({:class, "qa_register"})
  end
end
