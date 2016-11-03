defmodule Rezzy do
  @doc """
  Manages reservations.
  """

  # Move separate file
  # Demonstrate alias

  defmodule Reservation do
    defstruct reserved_for: nil, name: nil, email: nil, quantity: 4, id: nil
  end

  # Demonstrates functions
  # - with different arity
  # - pattern matching
  # - guard clause

  def add_reservation(_repository) do
    {:error, :missing_params}
  end

  def add_reservation(_repository, params) when is_nil(params) do
    {:error, :missing_params}
  end

  def add_reservation(repository, %{"reserved_for" => date, "name" => name, "email" => email, "quantity" => quantity}) do
    new_reservation = %Reservation{
      reserved_for: Date.from_iso8601!(date),
      name: name,
      email: email,
      quantity: String.to_integer(quantity)
    }

    Rezzy.InMemoryRepo.insert(new_reservation)
  end
end
