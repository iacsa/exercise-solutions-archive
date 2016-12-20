defmodule Series do

  @doc """
  Splits up the given string of numbers into an array of integers.
  """
  @spec digits(String.t) :: [non_neg_integer]
  def digits(number_string) do
    number_string |> String.to_char_list
                  |> Enum.map(&(&1 - ?0))
    
  end

  @doc """
  Generates sublists of a given size from a given string of numbers.
  """
  @spec slices(String.t, non_neg_integer) :: [list(non_neg_integer)]
  def slices(number_string, size) do
    number_string |> String.to_char_list
                  |> Stream.chunk(size, 1)
                  |> Stream.map(&to_string/1)
                  |> Enum.map(&digits/1)
  end

  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t, non_neg_integer) :: non_neg_integer
  def largest_product(number_string, size) do
    cond do
      size == 0 -> 1
      size > String.length(number_string) or size < 0 -> raise ArgumentError
      true ->
      number_string |> slices(size)
                    |> Stream.map(fn (x) -> Enum.reduce(x, 1, &*/2) end)
                    |> Enum.max
    end
  end
end
