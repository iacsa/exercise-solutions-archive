defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) do
    cond do
      Enum.min([a, b, c]) <= 0 -> 
        {:error, "all side lengths must be positive"}
      2 * Enum.max([a, b, c]) >= a + b + c ->
        {:error, "side lengths violate triangle inequality"}
      a == b and b == c -> {:ok, :equilateral}
      a == b or b == c or a == c -> {:ok, :isosceles}
      true -> {:ok, :scalene}
    end
  end
end
