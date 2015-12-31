defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext |> String.downcase
              |> String.to_char_list
              |> Enum.filter(&(&1 in ?a..?z or &1 in ?0..?9))
              |> Enum.map(&translate/1)
              |> Enum.chunk(5, 5, '')
              |> Enum.intersperse(' ')
              |> List.to_string
  end

  defp translate(char) do
    cond do
      char in ?a..?z -> ?z + ?a - char
      true -> char
    end
  end
end
