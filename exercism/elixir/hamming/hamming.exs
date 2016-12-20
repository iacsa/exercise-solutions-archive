defmodule Hamming do
  @spec hamming_distance([char], [char]) :: any
  def hamming_distance(strand1, strand2) do
    if length(strand1) == length(strand2) do
      {:ok,
       strand1 |> Enum.zip(strand2)
               |> Enum.count(fn ({x, y}) -> x != y end)
      }
    else
      {:error, "Lists must be the same length"}
    end
  end
end
