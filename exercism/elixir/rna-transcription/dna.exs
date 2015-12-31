defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna |> Enum.map(& case &1 do
      ?G -> ?C
      ?C -> ?G
      ?T -> ?A
      ?A -> ?U
    end)
  end
end
