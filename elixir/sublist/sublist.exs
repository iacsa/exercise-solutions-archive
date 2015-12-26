defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  # :equal, :sublist, :superlist, :unequal
  def compare(a, b) do
    {la, lb} = {length(a), length(b)}
    cond do
      a == b -> :equal
      la > lb and is_sublist(b, a) -> :superlist
      la < lb and is_sublist(a, b) -> :sublist
      true -> :unequal
    end
  end

  defp is_sublist(a, b) do
    is_prefix(a, b) or (length(a) < length(b) and is_sublist(a, tl(b)))
  end

  defp is_prefix(a, b) do
    case {a, b} do
      {[], _} -> true
      {[x | xs], [x | ys]} -> is_prefix(xs, ys)
      _ -> false
    end
  end
end
