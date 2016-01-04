defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate(nucleotide)
    strand |> Enum.count(& validate(&1) and &1 == nucleotide)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: Map.t
  def histogram(strand) do
    Enum.reduce(strand, %{?A => 0, ?C => 0, ?G => 0, ?T => 0}, &increment/2)
  end
  defp increment(char, dict) do
    validate(char)
    Map.update(dict, char, 0, &(&1+1))
  end

  defp validate(char) do
    unless char in @nucleotides do raise ArgumentError end
    true
  end
end
