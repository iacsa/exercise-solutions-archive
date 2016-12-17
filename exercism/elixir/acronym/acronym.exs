# Ported from my Ruby solution
   
defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(phrase) do
    # We want to include in the abbreviation:
    # 1. Any capital letter not immediately preceded by another capital letter
    # 2. Any lowercase letter not immediately preceded by any other letter
    ~r/(?<![A-Z])[A-Z]|(?<![a-zA-Z])[a-z]/
      |> Regex.scan(phrase)
      |> Enum.join
      |> String.upcase
  end
end
