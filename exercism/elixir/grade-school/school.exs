defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(Map.t, String.t, pos_integer) :: Map.t
  def add(db, name, grade) do
    Map.update(db, grade, [name], & Enum.sort([name | &1]))
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(Map.t, pos_integer) :: [String]
  def grade(db, grade) do
    Map.get(db, grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(Map.t) :: Map.t
  def sort(db) do
    Map.to_list(db)
  end
end
