defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday :: :monday | :tuesday | :wednesday | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    day = first_weekday(year, month, weekday)
    {year, month, day + case schedule do
        :first -> 0
        :second -> 7
        :third -> 14
        :fourth -> 21
        :last -> if lies_in_month?(year, month, day + 28) do 28 else 21 end
        :teenth -> rem(day + 1, 7) - rem(day - 1, 7) + 12
    end}
  end
  defp first_weekday(year, month, weekday) do
    year = if month in [1, 2] do year - 1 else year end
    y = rem(year, 100)
    m = rem(month + 9, 12)
    day = rem(1 + trunc(2.6*m + 2.4) + div(5*y, 4) + div(21*year, 400), 7)
    rem(case weekday do
      :sunday -> 0
      :monday -> 1
      :tuesday -> 2
      :wednesday -> 3
      :thursday -> 4
      :friday -> 5
      :saturday -> 6
    end + 6*day, 7) + 1
  end
  defp lies_in_month?(year, month, day) do
    day > 0 and cond do
      day == 31 -> month in [1, 3, 5, 7, 8, 10, 12]
      day == 30 -> month != 2
      day == 29 -> month != 2 or leap_year?(year)
      true -> day <= 31
    end
  end
  defp leap_year?(year) do
    divides?(400, year) or not divides?(100, year) and divides?(4, year)
  end
  defp divides?(p, n) do rem(n, p) == 0 end
end
