defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    (2..limit) |> Enum.reduce([], fn(candidate, primes) ->
      if Enum.any?(primes, & rem(candidate, &1) == 0) do
        primes
      else
        [candidate | primes]
      end
    end) |> Enum.reverse
  end
end
