defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.
  """

  @spec flatten(list) :: list
  def flatten(list) do
    Enum.flat_map(list, &(
    case &1 do
      nil -> []
      sublist when is_list(sublist) -> flatten(sublist)
      item -> [item]
    end))
  end
end
