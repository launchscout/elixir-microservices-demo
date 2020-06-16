defmodule ProductServerTest do
  use ExUnit.Case
  doctest ProductServer

  test "greets the world" do
    assert ProductServer.hello() == :world
  end
end
