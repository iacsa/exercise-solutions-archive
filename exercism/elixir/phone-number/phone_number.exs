defmodule Phone do
  @invalid "0000000000"

  @spec number(String.t) :: String.t
  def number(raw) do
    clean = String.replace(raw, ~r/[\(\)\-\. ]/, "")
    cond do
      not String.match?(clean, ~r/^[0-9]+$/) -> @invalid
      String.length(clean) == 10 -> clean
      String.length(clean) == 11 and String.starts_with?(clean, "1")
        -> String.slice(clean, 1, 11)
      true -> @invalid
    end
  end

  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw |> number
        |> String.slice(0, 3)
  end

  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    num = number(raw)
    "(#{String.slice(num, 0, 3)}) #{String.slice(num, 3, 3)}-#{String.slice(num, 6, 4)}"
  
  end
end
