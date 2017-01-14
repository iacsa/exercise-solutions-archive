defmodule Matrix do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t) :: [[integer]]
  def rows(lines) do
    lines
      |> String.split("\n")
      |> Enum.map(&to_int_list/1)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t) :: [[integer]]
  def columns(lines) do
    lines
      |> rows
      |> transpose
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t) :: [{integer, integer}]
  def saddle_points(lines) do
    row_maxs =
      lines
        |> rows
        |> Enum.map(&Enum.max/1)
        |> Enum.with_index
    col_mins =
      lines
        |> columns
        |> Enum.map(&Enum.min/1)
        |> Enum.with_index
    for {max, i} <- row_maxs,
        {min, j} <- col_mins,
        max == min,
        do: {i, j}
  end

  @spec to_int_list(String.t) :: [integer]
  def to_int_list(line) do
    line
      |> String.split
      |> Enum.map(&(&1 |> Integer.parse |> elem(0)))
  end

  @spec transpose([[Any.t]]) :: [[Any.t]]
  def transpose(ll) do
    ll
      |> Enum.zip
      |> Enum.map(&Tuple.to_list/1)
  end
end
