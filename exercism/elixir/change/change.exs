defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}
  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, values) do
    default = Enum.reduce(values, %{}, &(Map.put(&2, &1, 0)))
    aux(amount, 1, %{0 => {:ok, default}}, values)
  end

  defp aux(amount, current, optimal, values) do
    if amount < current do
      Map.get(optimal, amount, :error)
    else
      optimum = values
        |> Enum.map(&{&1, Map.get(optimal, current - &1, :error)})
        |> Enum.filter(fn({_, l}) -> l != :error end)
        |> Enum.map(fn({v, {_, l}}) -> Map.update!(l, v, &(&1 + 1)) end)
        |> Enum.sort_by(&(Map.values(&1) |> Enum.sum))
        |> Enum.fetch(0)

      aux(amount, current + 1, Map.put(optimal, current, optimum), values)
    end
  end
end
