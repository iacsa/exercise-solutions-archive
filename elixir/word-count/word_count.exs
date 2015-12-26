defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
      |> String.downcase
      |> String.split(~r/[^\p{L}\p{N}-]+/u, trim: true)
      |> Enum.reduce(%{}, & Dict.put(&2, &1, (&2[&1] || 0) + 1))
  end
end
