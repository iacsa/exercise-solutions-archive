defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t) :: integer
  def checksum(number) do
    number
    |> String.reverse
    |> String.graphemes
    |> Stream.with_index
    |> Stream.map(&compute_digit/1)
    |> Enum.sum
  end

  defp compute_digit({digit, index}) do
    x = String.to_integer(digit) * (rem(index, 2) + 1)
    x - 9 * div(x, 10)
  end

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t) :: boolean
  def valid?(number) do
    rem(checksum(number), 10) == 0
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t) :: String.t
  def create(number) do
    number <> to_string(9 - rem(checksum(number <> "9"), 10))
  end
end
