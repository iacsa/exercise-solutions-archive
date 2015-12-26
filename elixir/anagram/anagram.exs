defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates |> Enum.filter(&
      String.downcase(base) != String.downcase(&1) and
      canonical(base) == canonical(&1))
  end

  defp canonical(str) do
    str |> String.downcase
        |> String.to_char_list
        |> Enum.sort
  end
end
