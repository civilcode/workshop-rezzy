defmodule Rezzy do
  @doc """
  Manages reservations.
  """

  # Move separate file
  # Demonstrate alias
  defmodule Reservation do
    defstruct date: nil, name: nil, email: nil, quantity: 4
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

  def add_reservation(repository, %{"date" => date, "name" => name, "email" => email, "quantity" => quantity}) do
    new_reservation = %Reservation{date: Date.from_iso8601!(date), name: name, email: email, quantity: String.to_integer(quantity)}
    # rewrite with the pipe operator
    {:ok, [new_reservation | repository] }
  end
end
