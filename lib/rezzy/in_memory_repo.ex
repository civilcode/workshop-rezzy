defmodule Rezzy.InMemoryRepo do
  def start_link do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def get(type, id) do
    Agent.get(__MODULE__, fn list ->
      Enum.find(list, fn(el) -> el.id == id and el.__struct__ == type end)
    end)
  end

  def insert(record) do
    record = %{record | id: :rand.uniform(100) }
    Agent.update(__MODULE__, fn(list) -> [record | list] end)
    {:ok, record}
  end
end
