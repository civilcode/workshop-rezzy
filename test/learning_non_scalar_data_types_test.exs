defmodule LearningNonScalarDataTypesTest do
  use ExUnit.Case

  # [Types, Tuples, Records, Maps & Structs](http://undiscoveredfeatures.com/types-tuples-records-maps-structs/)

  # "Tuples are similar to lists but are stored contiguously in memory. This makes accessing
  # their length fast but modification expensive; the new tuple must be copied entirely to memory."
  # - [Elixir School](https://elixirschool.com/lessons/basics/collections/)

  describe "tuples - ordered collection of values " do
    test "pattern matching" do
      {status, _count, _action} = {:ok, 42, "next"}
      assert status == :ok
    end

    test "tagged tuple" do
      {:ok, file} = File.open("mix.exs")
      assert file
    end
  end

  # Lists are Linked lists
  # Linear time O(n) - "informally, this means that for large enough input sizes the
  # running time increases linearly with the size of the input"
  # - [Wikipedia](https://en.wikipedia.org/wiki/Time_complexity)

  describe "lists - linked data structure" do
    test "manipulating a list" do
      head = hd [3.14, :pie, "Apple"]
      assert head == 3.14

      tail = tl [3.14, :pie, "Apple"]
      assert tail == [:pie, "Apple"]
    end

    test "destructing a list with pattern matching" do
      [h | t] = [3.14, :pie, "Apple"]
      assert h == 3.14
      assert t == [:pie, "Apple"]

      assert [3.14, :pie, "Apple"] == [3.14 | [:pie, "Apple"]]
    end
  end

  # "Keys are atoms.
  # Keys are ordered.
  # Keys are not unique.
  # For these reasons keyword lists are most commonly used to pass options to functions."
  # - [Elixir School](https://elixirschool.com/lessons/basics/collections/)

  describe "keyword lists" do
    test "are implemented with tuples" do
      assert [{:foo, "bar"}, {:hello, "world"}] == [foo: "bar", hello: "world"]

      values = Enum.map([foo: "bar", hello: "world"], fn({_, value}) -> value end)
      assert values == ["bar", "world"]
    end

    test "passing options to functions" do
      assert [foo: "bar", hello: "world"] == keyword_list_example(:test, foo: "bar", hello: "world")
      assert [] == keyword_list_example(:test)
    end
  end

  def keyword_list_example(_ignore, opts \\ []) do
    opts
  end

  # - key-value store, Hash, associative array
  # - Keys are unique
  # - Erlang type added in 2013
  describe "maps" do
    test "accessing" do
      map = %{:foo => "bar", :hello => "world"}
      assert map.foo == "bar"
      assert map[:foo] == "bar"
    end

    test "updating" do
      assert %{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"}
      map = %{:foo => "bar", :hello => "world"}
      # an example of immutability
      assert %{foo: "baz", hello: "world"} == %{map | foo: "baz"}
    end

    # match on a subset of keys
    test "pattern matching on a subset of keys" do
      %{foo: result} = %{foo: "bar", hello: "world"}
      assert result == "bar"
    end
  end

  defmodule Reservation do
    defstruct date: nil, name: nil, email: nil, quantity: 4
  end

  describe "structs" do
    test "accessing" do
      reservation = %Reservation{date: ~D[2016-11-11], name: "Nicholas Henry", email: "nicholas@civilcode.io", quantity: 4}
      assert reservation.email == "nicholas@civilcode.io"

      map = %{__struct__: Reservation, date: ~D[2016-11-11], name: "Nicholas Henry", email: "nicholas@civilcode.io", quantity: 4}
      assert map == reservation
    end
  end
end
