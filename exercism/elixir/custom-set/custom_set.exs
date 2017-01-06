defmodule CustomSet do

  @opaque t :: %__MODULE__ { content: Map.t }
  defstruct content: %{}

  @spec new(Enum.t) :: t
  def new(content) do
    %CustomSet { content: Map.new(content, fn k -> {k, true} end) }
  end

  @spec empty?(t) :: boolean
  def empty?(set) do
    Enum.empty?(set.content)
  end

  @spec contains?(t, any) :: boolean
  def contains?(set, item) do
    Map.has_key?(set.content, item)
  end

  @spec subset?(t, t) :: boolean
  def subset?(subset, superset) do
    empty?(difference(subset, superset))
  end

  @spec disjoint?(t, t) :: boolean
  def disjoint?(set1, set2) do
    equal?(difference(set1, set2), set1)
  end

  @spec equal?(t, t) :: boolean
  def equal?(set1, set2) do
    Enum.sort(set1.content) == Enum.sort(set2.content)
  end

  @spec add(t, any) :: t
  def add(set, item) do
    %__MODULE__ { content: Map.put(set.content, item, true) }
  end

  @spec intersection(t, t) :: t
  def intersection(set1, set2) do
    difference(set1, difference(set1, set2))
  end

  @spec difference(t, t) :: t
  def difference(set1, set2) do
    %__MODULE__ { content: Map.drop(set1.content, Map.keys(set2.content)) }
  end

  @spec union(t, t) :: t
  def union(set1, set2) do
    %__MODULE__ { content: Map.merge(set1.content, set2.content) }
  end

  @spec size(CustomSet.t) :: non_neg_integer
  def size(set) do
    length(set.content)
  end
  
  @spec to_list(CustomSet.t) :: List.T
  def to_list(set) do
    Enum.sort(set.content)
  end
end
