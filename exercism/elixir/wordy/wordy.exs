defmodule Wordy do

  def f_cubed(x), do: x * x * x

  @keywords %{
    "What is" =>
      :start,
    "?" =>
      :end,
    "plus" =>
      {:binary_function, &+/2},
    "minus" =>
      {:binary_function, &-/2},
    "multiplied by" =>
      {:binary_function, &*/2},
    "divided by" =>
      {:binary_function, &//2},
    # Definining new operations is simple
    # "cubed" =>
    #   {:unary_function, &Wordy.f_cubed/1},
    }
  
  @split_regex (
    @keywords
      |> Map.keys
      |> Enum.map(&String.replace(&1, ~r/([\?]+)/, "\\\\\\1"))
      |> Enum.join("|")
      |> Regex.compile
      |> elem(1)
    )

  @doc """
  Calculate the math problem in the sentence.
  """
  @spec answer(String.t) :: integer
  def answer(query) do
    query
      |> split
      |> parse
      |> interpret
  end
  
  defp split(query) do
    query
      |> String.split(@split_regex, include_captures: true, trim: true)
      |> Enum.map(&String.trim/1)
  end

  defp parse(words), do: Enum.map(words, &parse_word/1)

  defp parse_word(word) do
    Map.get_lazy(@keywords, word, fn () -> {:value, parse_value(word)} end)
  end

  defp parse_value(word) do
    case Integer.parse(word) do
      {value, ""} ->
        value
      _ ->
        raise ArgumentError
    end
  end

  defp interpret([:start, {:value, x} | rest]), do: calculate(rest, x)
  defp interpret(_), do: raise ArgumentError

  defp calculate(tokens, accumulator) do
    case tokens do
      [:end] ->
        accumulator
      [{:unary_function, f} | rest] ->
        calculate(rest, f.(accumulator))
      [{:binary_function, f}, {:value, x} | rest] ->
        calculate(rest, f.(accumulator, x))
      _ ->
        raise ArgumentError
    end
  end
end
