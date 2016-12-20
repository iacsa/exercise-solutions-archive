defmodule Accumulate do

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    Enum.reverse acc_rev(list, fun, [])
  end

  defp acc_rev(list, fun, acc) do
    case list do
      [] -> acc
      [h | t] -> acc_rev(t, fun, [fun.(h) | acc])
    end
  end
end
