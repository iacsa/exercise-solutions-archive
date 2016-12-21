defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    aux(String.graphemes(sentence), HashSet.new)
  end

  defp aux([], _), do: true
  defp aux([c | chars], seen) do
    cond do
      Set.member?(seen, c) -> false
      String.match?(c, ~r/\p{L}/u) -> aux(chars, Set.put(seen, c))
      true -> aux(chars, seen)
    end
  end
end
