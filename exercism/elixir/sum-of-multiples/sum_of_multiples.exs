defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.

  The default factors are 3 and 5.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors \\ [3, 5]) do
    0..(limit-1) |> Enum.filter(&(is_multiple_of?(&1, factors)))
             |> Enum.sum
  end

  defp is_multiple_of?(n, factors) do
    Enum.any?(factors, &(rem(n, &1) == 0))
  end
end
