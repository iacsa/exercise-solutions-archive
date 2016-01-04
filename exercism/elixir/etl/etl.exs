defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """

  @spec transform(Map.t) :: map()
  def transform(input) do
    Enum.reduce(input, Map.new, fn ({letter, words}, acc) ->
      Enum.reduce(words, acc, fn (word, acc) ->
        Map.put_new(acc, String.downcase(word), letter)
      end)
    end)
  end
end
