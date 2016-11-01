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

  setup do
    Rezzy.InMemoryRepo.start_link

    :ok
  end

  test "adding reservations" do
    repository = []
    params = %{"reserved_for" => "2016-11-11", "name" => "Nicholas", "email" => "nicholas@civilcode.io", "quantity" => "4"}
    # destructuring / pattern matching
    # tagged tuples
    {:ok, reservation} = Rezzy.add_reservation(repository, params)
    # IEx.pry
    # :debugger.start()

    # sigils, Date/DateTime
    assert reservation.id
    assert %{name: "Nicholas", reserved_for: ~D[2016-11-11], email: "nicholas@civilcode.io", quantity: 4} = reservation

    assert Rezzy.InMemoryRepo.get(Rezzy.Reservation, reservation.id)
  end
end
