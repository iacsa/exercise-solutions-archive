defmodule RailFenceCipher do
  @doc """
  Encode a given plaintext to the corresponding rail fence ciphertext
  """
  @spec encode(String.t, pos_integer) :: String.t
  def encode(text, 1), do: text
  def encode(text, rails) do
    text
      |> String.to_charlist
      |> distribute([], List.duplicate([], rails), true)
      |> to_string
  end


  @doc """
  Decode a given rail fence ciphertext to the corresponding plaintext
  """
  @spec decode(String.t, pos_integer) :: String.t
  def decode(text, 1), do: text
  def decode(text, rails) do
    chars = String.to_charlist(text)
    chars
      |> distribute([], List.duplicate([], rails), true)
      |> replace_rowwise(chars)
      |> harvest([])
      |> to_string
  end


  defp distribute([], stack, posts, forward) do
    # After processing all text, reorder rails
    {first, second} = if forward do {stack, posts} else {posts, stack} end
    Enum.reverse(first) ++ second
      |> Enum.map(&Enum.reverse/1)
  end
  defp distribute(text, [endrail | rails], [], forward) do
    # Change direction at the ends
    distribute(text, [endrail], rails, !forward)
  end
  defp distribute([char | text], processed, [current_rail | rails], forward) do
    distribute(text, [[char | current_rail] | processed], rails, forward)
  end


  defp replace_rowwise([], []), do: []
  defp replace_rowwise([row | rest], text) do
    size = Enum.count(row)
    [Enum.take(text, size) | replace_rowwise(rest, Enum.drop(text, size))]
  end


  defp harvest([], [endrail | rails]), do: harvest(rails, [endrail])
  defp harvest([[] | _rest], _stack), do: []
  defp harvest([[c | cs] | rest], stack), do: [c | harvest(rest, [cs | stack])]
end
