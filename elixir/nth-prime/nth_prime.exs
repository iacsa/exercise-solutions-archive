defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) do
    if count <= 0, do: raise ArgumentError
    2 |> Stream.unfold(&{&1, &1+1})
      |> Stream.scan([], fn(candidate, primes) ->
           if Enum.any?(primes, &rem(candidate, &1)==0) do
             primes
           else
             [candidate | primes]
           end
         end)
      |> Enum.find(&length(&1)==count)
      |> Enum.at(0)
  end
end
