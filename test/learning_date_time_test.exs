defmodule LearningDateTimeTest do
  use ExUnit.Case

  # Timex https://github.com/bitwalker/timex

  test "new dates" do
    {:ok, new_date} = Date.new(2016, 11, 02)
    assert ~D[2016-11-02] == new_date
  end

  # IO.inspect x, structs: false
  test "dates are structs" do
    assert ~D[2016-11-02] == %{__struct__: Date, calendar: Calendar.ISO, day: 2, month: 11, year: 2016}
  end
end
