defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest. 
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    case Enum.find(2..number+1, & rem(number, &1) == 0) do
      p when is_integer(p) -> [p | factors_for(div(number, p))]
      _ -> []
    end
  end
end
