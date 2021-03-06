defmodule RunLengthEncoder do 
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form. 
  "1H1O1R1S1E" => "HORSE" 
  """
  @spec encode(String.t) :: String.t
  def encode(message) do
    ~r/(.)\1*/
      |> Regex.scan(message)
      |> Enum.map(fn([x, y]) ->
        Integer.to_string(String.length(x)) <> y
      end)
      |> Enum.join
  end

  @spec decode(String.t) :: String.t
  def decode(code) do
    ~r/[0-9]+|./
      |> Regex.scan(code)
      |> List.flatten
      |> Enum.chunk(2)
      |> Enum.map(fn([count, char]) ->
        String.duplicate(char, String.to_integer(count))
      end)
      |> Enum.join
  end
end
