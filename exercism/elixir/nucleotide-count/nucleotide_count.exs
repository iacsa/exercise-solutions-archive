defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate(nucleotide)
    strand |> Enum.count(& validate(&1) and &1 == nucleotide)
  end

  @spec histogram([char]) :: map
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
