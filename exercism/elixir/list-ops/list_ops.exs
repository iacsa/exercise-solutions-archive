defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    reduce(l, 0, & &2 + (if is_integer(&1) and &1 >= 0 do 1 else 0 end))
  end

  @spec reverse(list) :: list
  def reverse(l, acc \\ []) do
    reduce(l, [], & [&1 | &2])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reduce(l, [], & [f.(&1) | &2]) |> reverse
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reduce(l, [], & if f.(&1) do [&1 | &2] else &2 end) |> reverse
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    case l do
      [x | xs] -> reduce(xs, f.(x, acc), f)
      _ -> acc
    end
  end

  @spec append(list, list) :: list
  def append(a, b) do
    reduce(reverse(a), b, & [&1 | &2])
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reduce(reverse(ll), [], &append/2)
  end
end
