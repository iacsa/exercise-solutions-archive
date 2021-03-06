defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      except every year that is evenly divisible by 400.
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    divides?(400, year) or (not divides?(100, year) and divides?(4, year))
  end
  defp divides?(p, n) do
    rem(n, p) == 0
  end
end
