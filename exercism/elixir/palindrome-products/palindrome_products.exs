defmodule Palindromes do

  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map() 
  def generate(max_factor, min_factor \\ 1) do
    (for a <- min_factor..max_factor,
         b <- min_factor..max_factor,
         a <= b,
         is_palindrome?(a*b),
         do: [a, b])
      |> Enum.reverse
      |> Enum.reduce(Map.new, &insert/2)
  end

  defp insert([a, b], dict) do
    Map.update(dict, a*b, [[a, b]], &([[a, b] | &1]))
  end
  defp is_palindrome?(number) do
    to_char_list(number) == Enum.reverse(to_char_list(number))
  end
end
