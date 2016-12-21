defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

    @students [ 
      :alice, :bob, :charlie, :david,
      :eve, :fred, :ginny, :harriet,
      :ileana, :joseph, :kincaid, :larry,
    ]

    @plants %{
      "C" => :clover,
      "G" => :grass,
      "R" => :radishes,
      "V" => :violets,
    }
  
  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @students) do
    student_names = Enum.sort(student_names)

    map = Enum.reduce(student_names, %{}, &(Map.put(&2, &1, {})))

    rows = String.split(info_string, "\n")
    rows = Enum.map(rows, &(
      &1 |> String.graphemes |> Enum.chunk(2)
    ))

    # My elixir version doesn't have Enum.zip/1 yet :-(
    Enum.zip(Enum.at(rows, 0), Enum.at(rows, 1))
    |> Enum.zip(student_names)
    |> Enum.reduce(map, &insert/2)
  end

  defp insert({{row1, row2}, student}, map) do
    Enum.reduce(row1 ++ row2, map, fn(field, map) ->
      Map.update!(map, student, &(Tuple.append(&1, @plants[field])))
    end)
  end
end
