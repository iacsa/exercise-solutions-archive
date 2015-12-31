defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t

  @sounds [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]

  def convert(number) do
    sounds = Enum.filter(@sounds, fn({p,_}) -> rem(number, p) == 0 end)
    if Enum.empty?(sounds) do
      Integer.to_string(number)
    else
      Enum.reduce(sounds, "", fn({_,s}, acc) -> acc <> s end)
    end
  end
end
