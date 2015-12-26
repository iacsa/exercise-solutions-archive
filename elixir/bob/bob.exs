defmodule Teenager do
  def hey (input) do
    cond do
      String.ends_with?(input, "?") -> "Sure."
      String.match?(input, ~r/^\s*$/) -> "Fine. Be that way!"
      String.match?(input, ~r/^[^[:lower:]]*[[:upper:]][^[:lower:]]*$/) ->
        "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
