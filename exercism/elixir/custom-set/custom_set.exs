defmodule CustomSet do
  # This lets the compiler check that all Set callback functions have been implemented.
  @behaviour Set

  @type t :: %CustomSet{content: List.t}
  defstruct content: []

  @spec new(List.t) :: CustomSet.t
  def new(content \\ []) do
    %CustomSet{content: Enum.uniq(content)}
  end

  @spec delete(CustomSet.t, any) :: CustomSet.t
  def delete(set, item) do
    new(List.delete(set.content, item))
  end

  @spec equal?(CustomSet.t, CustomSet.t) :: Bool.t
  def equal?(set1, set2) do
    Enum.sort(set1.content) == Enum.sort(set2.content)
  end

  @spec difference(CustomSet.t, CustomSet.t) :: CustomSet.t
  def difference(set1, set2) do
    Enum.reduce(set2.content, set1, &(delete(&2, &1)))
  end

  @spec intersection(CustomSet.t, CustomSet.t) :: CustomSet.t
  def intersection(set1, set2) do
    difference(set1, difference(set1, set2))
  end

  @spec disjoint?(CustomSet.t, CustomSet.t) :: Bool.t
  def disjoint?(set1, set2) do
    equal?(difference(set1, set2), set1)
  end

  @spec empty(CustomSet.t) :: CustomSet.t
  def empty(set) do
    new
  end

  @spec member?(CustomSet.t, any) :: Bool.t
  def member?(set, item) do
    Enum.member?(set.content, item)
  end

  @spec put(CustomSet.t, any) :: CustomSet.t
  def put(set, item) do
    if member?(set, item), do: set, else: new([item | set.content])
  end

  @spec size(CustomSet.t) :: non_neg_integer
  def size(set) do
    length(set.content)
  end

  @spec subset?(CustomSet.t, CustomSet.t) :: Bool.t
  def subset?(subset, superset) do
    size(difference(subset, superset)) == 0
  end
  
  @spec to_list(CustomSet.t) :: List.T
  def to_list(set) do
    Enum.sort(set.content)
  end

  @spec union(CustomSet.t, CustomSet.t) :: CustomSet.t
  def union(set1, set2) do
    new(set1.content ++ set2.content)
  end
end

defimpl Inspect, for: CustomSet do
  import Inspect.Algebra
  def inspect(dict, opts) do
    concat ["#<CustomSet ", to_doc(CustomSet.to_list(dict), opts), ">"]
  end
end
