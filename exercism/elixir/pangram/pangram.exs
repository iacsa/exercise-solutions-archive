defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.
  """

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    sentence = String.downcase(sentence)
    alphabet = ?a .. ?z |> Enum.to_list |> to_string |> String.graphemes
    Enum.all?(alphabet, &(String.contains?(sentence, &1)))
  end
end
