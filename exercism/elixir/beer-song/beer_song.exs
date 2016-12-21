defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(n) do
    n = n - 1
    "#{bottles(n) |> String.capitalize} on the wall, #{bottles(n)}.\n" <>
    "#{action(n)}, #{bottles(rem(n + 99, 100))} on the wall.\n"
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ Range.new(100, 1)) do
    range
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end

  defp bottles(n) do
    number = if n == 0 do "no more" else n end
    suffix = if n == 1 do "" else "s" end
    "#{number} bottle#{suffix} of beer"
  end

  defp action(n) do
    if n == 0 do
      "Go to the store and buy some more"
    else
      pronoun = if n == 1 do "it" else "one" end
      "Take #{pronoun} down and pass it around"
    end
  end
end
