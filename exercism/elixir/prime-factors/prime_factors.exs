defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest. 
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    fac_rev(number, 2, [])
    |> Enum.reverse
  end

  def fac_rev(number, current, factors) do
    limit = round(:math.sqrt(number) + 1)
    case Enum.find(current .. limit, & rem(number, &1) == 0) do
      nil -> if number == 1 do factors else [number | factors] end
      p -> fac_rev(div(number, p), p, [p | factors])
    end
  end
end
