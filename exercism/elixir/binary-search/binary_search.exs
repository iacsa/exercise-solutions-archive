defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    search_rec(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp search_rec({}, _key, _low, _high), do: :not_found
  defp search_rec(numbers, key, low, high) do
    mid = Integer.floor_div(high + low, 2)
    pivot = elem(numbers, mid)
    cond do
      low > high ->
        :not_found
      pivot > key ->
        search_rec(numbers, key, low, mid - 1)
      pivot < key ->
        search_rec(numbers, key, mid + 1, high)
      pivot == key ->
        {:ok, mid}
    end
  end
end
