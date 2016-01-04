defmodule Frequency do
  @doc """
  Count word frequency in parallel.

  Returns a dict of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: Map.t
  def frequency(texts, workers) do
    start_workers(texts, 0, workers)
  end

  defp start_workers(texts, worker_id, worker_count) do
    size = trunc(Float.ceil(length(texts) / worker_count))
    handler = self()
    spawn(fn() ->
      count_letters(Enum.slice(texts, worker_id*size, size), handler)
    end)

    if worker_id + 1 < worker_count do
      start_workers(texts, worker_id + 1, worker_count)
    else
      get_results(Map.new, 0, worker_count)
    end
  end

  defp get_results(counts, got, worker_count) do
    if got < worker_count do
      receive do
        part ->
          merged = Map.merge(counts, part, fn(_, c1, c2) -> c1 + c2 end)
          get_results(merged, got + 1, worker_count)
      end
    else
      counts
    end
  end

  defp count_letters(texts, handler) do
    counts = texts |> Enum.reduce(Map.new, fn(text, acc) ->
      text |> String.downcase
           |> String.split("")
           |> Stream.filter(&(String.match?(&1, ~r/\p{L}/u)))
           |> Enum.reduce(acc, &(Map.update(&2, &1, 1, fn(c) -> c+1 end)))
    end)
    send(handler, counts)
  end
end
