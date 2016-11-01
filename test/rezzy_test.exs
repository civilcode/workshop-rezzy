# Note: EXS format
defmodule RezzyTest do
  use ExUnit.Case
  doctest Rezzy

  # 1. Pattern Matching

  # 2. Non-scalar Data Types/Collections
  #   - lists
  #   - tuples
  #   - keyword lists
  #   - maps
  #   - struct  (to come)

  # 3. Sigils

  # 4. DateTime

  # 5. Refactor to a pipeline

  require IEx

  test "adding reservations" do
    repository = []
    params = %{"date" => "2016-11-11", "name" => "Nicholas", "email" => "nicholas@civilcode.io", "quantity" => "4"}
    # destructuring / pattern matching
    # tagged tuples
    {:ok, repository} = Rezzy.add_reservation(repository, params)
    # IEx.pry
    # :debugger.start()

    assert 1 == length(repository)
    # sigils, Date/DateTime
    expected = %Rezzy.Reservation{date: ~D[2016-11-11], email: "nicholas@civilcode.io", quantity: 4}
    |> Map.put(:name, "Nicholas")

    assert hd(repository) == expected
  end
end
