defmodule Queens do
  @typep position :: { integer, integer }
  @opaque t :: %__MODULE__{ black: position, white: position }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new(position, position) :: t
  def new(white \\ {0, 3}, black \\ {7, 3}) do
    if white == black, do: raise ArgumentError
    %__MODULE__{ white: white, black: black }
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(t) :: String.t
  def to_string(%__MODULE__{ white: white, black: black }) do
    Enum.map_join(0 .. 7, "\n", fn row ->
      Enum.map_join(0 .. 7, " ", fn col ->
        case { row, col } do
          ^white -> "W"
          ^black -> "B"
          _ -> "_"
        end
      end)
    end)
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(t) :: Boolean.t
  def can_attack?(%__MODULE__{ white: { wx, wy }, black: { bx, by } }) do
    dx = abs(wx - bx)
    dy = abs(wy - by)
    min(dx, dy) == 0 || dx == dy
  end
end
