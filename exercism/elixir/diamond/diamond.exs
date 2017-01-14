defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """
  @spec build_shape(char) :: String.t
  def build_shape(letter) do
    letter
      |> build_half
      |> pad
      |> mirror
      |> Enum.join
  end

  @spec build_half(char) :: [String.t]
  defp build_half(?A), do: ["A"]
  defp build_half(letter) do
    spacing = String.duplicate(" ", 2 * (letter - ?A) - 1)
    letter_string = to_string([letter])
    next_row = letter_string <> spacing <> letter_string

    [next_row | build_half(letter - 1)]
  end

  @spec pad([String.t]) :: [String.t]
  defp pad(lines) do
    lines
      |> Enum.with_index
      |> Enum.map(&pad_line/1)
  end

  @spec pad_line({String.t, integer}) :: String.t
  defp pad_line({str, width}) do
    padding = String.duplicate(" ", width)
    padding <> str <> padding <> "\n"
  end

  @spec mirror([String.t]) :: String.t
  defp mirror(lines) do
    Enum.reverse(lines) ++ Enum.drop(lines, 1)
  end
end
