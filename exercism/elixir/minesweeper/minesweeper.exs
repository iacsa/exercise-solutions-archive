defmodule Minesweeper do

  @doc """
  Annotate empty spots next to mines with the number of mines next to them.
  """
  @spec annotate([String.t]) :: [String.t]

  def annotate(board) do
    h = length(board)

    counts = board
      |> Enum.with_index
      |> Enum.reduce(Map.new(), fn({row, y}, acc) ->
        row
          |> String.to_char_list
          |> Enum.with_index
          |> Enum.filter(fn({c, _}) -> c == ?* end)
          |> Enum.reduce(acc, fn({_, x}, acc) ->
            Enum.reduce(0..2, acc, fn(dx, acc) ->
              Enum.reduce(0..2, acc, fn(dy, acc) ->
                Map.update(acc, (x+dx)*(h+2) + y+dy, 1, &(&1+1))
              end)
            end)
          end)
      end)

    board
      |> Enum.with_index
      |> Enum.map(fn({row, y}) ->
        row
          |> String.to_char_list
          |> Enum.with_index
          |> Enum.map(fn({c, x}) ->
            count = Map.get(counts, (x+1)*(h+2) + y+1)
            case c do
              ?* -> ?*
              _ when count in 1..9 -> ?0 + count
              _ -> ? 
            end
          end)
          |> to_string
      end)
  end
end
