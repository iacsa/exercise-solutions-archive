defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t) :: String.t
  def encode(text) do
    text
      |> normalize
      |> chunk
      |> transpose
      |> join
  end

  def normalize(text) do
    text
      |> String.downcase
      |> String.replace(~r/[^a-zA-Z0-9]/, "")
  end

  def chunk(""), do: [[]]
  def chunk(text) do
    size = square_size(text)
    # We pad chunks with empty strings to make &transpose work
    # List.zip would otherwise truncate the lists
    text
      |> String.to_charlist
      |> Enum.chunk(size, size, Stream.cycle([""]))
  end

  def transpose(lists) do
    lists
      |> List.zip
      |> Enum.map(&Tuple.to_list(&1))
  end

  def join(charlists) do
    Enum.map_join(charlists, " ", &to_string/1)
  end

  def square_size(text) do
    text
      |> String.length
      |> :math.sqrt
      |> ceiling
  end

  def ceiling(x) do
    f = trunc(x)
    if x - f > 0 do f + 1 else f end
  end
end
