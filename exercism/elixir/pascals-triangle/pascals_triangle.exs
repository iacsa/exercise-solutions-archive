defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(0), do: []
  def rows(1), do: [[1]]
  def rows(n) do
    previous = rows(n - 1)
    last_row = Enum.at(previous, -1)
    new_row =
      [0 | last_row]
        |> Enum.zip(last_row ++ [0])
        |> Enum.map(fn {x, y} -> x + y end)
    previous ++ [new_row]
  end
end
