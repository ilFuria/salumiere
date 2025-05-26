defmodule SalumiereTest do
  use ExUnit.Case
  doctest Salumiere

  test "greets the world" do
    assert Salumiere.hello() == :world
  end
end
