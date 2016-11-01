defmodule LearningSigilsTest do
  use ExUnit.Case

  test "lists" do
    assert ~w(a b c) == ["a", "b", "c"]
    assert ~w(a b c)a == [:a, :b, :c]
  end
end
