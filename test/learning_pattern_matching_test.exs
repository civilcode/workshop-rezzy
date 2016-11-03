defmodule LearningPatternMatching do
  use ExUnit.Case

  # = a match operator
  # * left-hand-side: "pattern"
  # * right-hand-side: "term"
  # * left-hand-side "pattern" is asserting a match on the right-hand-side "term"
  # x = a + 1 assertion and not an assignment

  test "basics" do
    assert a = 1
    assert 1 = a

    assert_raise MatchError, "no match of right hand side value: 1", fn -> 2 = a end
  end

  test "matching non-scalar arrays" do
    {a, b, c} = {:hello, "world", 42}

    assert a == :hello
    assert b == "world"
    assert c == 42
  end
end
