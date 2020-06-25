defmodule WebServerWeb.FeatureCase do
  @moduledoc """
  This module defines the test case to be used by browser-based tests.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use Hound.Helpers
    end
  end

  setup tags do
    Hound.start_session(
      additional_capabilities: %{
        chromeOptions: %{
          "args" => ["--window-size=1920,4000"] |> put_headless(tags) |> put_user_agent(tags)
        }
      }
    )

    on_exit(fn ->
      Hound.end_session()
    end)

    {:ok, %{}}
  end

  defp put_headless(args, %{headless: false}), do: args
  defp put_headless(args, _), do: args ++ ["--headless", "--disable-gpu"]

  defp put_user_agent(args, %{async: false}), do: args

  defp put_user_agent(args, _) do
    user_agent = Hound.Browser.user_agent(:chrome)
    ["--user-agent=#{user_agent}" | args]
  end
end
