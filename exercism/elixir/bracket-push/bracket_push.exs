defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    aux([], String.graphemes(str))
  end

  defp aux(stack, chars) do
    case {stack, chars} do
      {ss, []} -> ss == []
      {ss, [c | cs]} when c in ["(", "[", "{"] -> aux([c | ss], cs)
      {["(" | ss], [")" | cs]} -> aux(ss, cs)
      {["[" | ss], ["]" | cs]} -> aux(ss, cs)
      {["{" | ss], ["}" | cs]} -> aux(ss, cs)
      {_, [c | _]} when c in [")", "]", "}"] -> false
      {ss, [_ | cs]} -> aux(ss, cs)
    end
  end
end
