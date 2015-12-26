defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    if String.match?(string, ~r/^[01]+$/) do
      string |> String.to_char_list
             |> Enum.reduce(0, & binary_value(&1) + 2*&2)
    else
      0
    end
  end
  defp binary_value(char) do
    case char do
      ?1 -> 1
      ?0 -> 0
      _ -> raise ArgumentError
    end
  end
end
