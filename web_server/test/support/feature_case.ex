defmodule WebServerWeb.FeatureCase do
  @moduledoc """
  This module defines the test case to be used by browser-based tests.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL
    end
  end

  setup _tags do
    {:ok, session} = Wallaby.start_session()
    {:ok, session: session}
  end
end
