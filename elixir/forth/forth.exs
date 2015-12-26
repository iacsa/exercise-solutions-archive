defmodule Forth do
  defmodule StackUnderflow do
    defexception message: "stack underflow"
  end
  defmodule InvalidWord do
    defexception [:message]
    def exception(value) do
      %InvalidWord{message: "invalid word: #{inspect value}"}
    end
  end
  defmodule UnknownWord do
    defexception [:message]
    def exception(value) do
      %UnknownWord{message: "unknown word: #{inspect value}"}
    end
  end
  defmodule DivisionByZero do
    defexception message: "division by zero"
  end

  @opaque evaluator :: %Forth{stack: List.t, defs: Map.t}
  defstruct stack: [], defs: Map.new

  @type token :: {:int, integer} | {:call, String.t} | {:def, List.t}
  
  @doc """
  Create a new evaluator.
  """
  @spec new() :: evaluator
  def new() do
    %Forth{}
  end

  @doc """
  Evaluate an input string, updating the evaluator state.
  """
  @spec eval(evaluator, String.t) :: evaluator
  def eval(ev, s) do
    s |> String.downcase
      |> String.split(~r/[\s[:cntrl:]]/u)
      |> parse
      |> Enum.reduce(ev, &execute/2)
  end

  @spec execute(List.t, evaluator) :: evaluator
  defp execute(token, ev) do
    case token do
      {:int, v} -> %{ev | stack: [v | ev.stack]}
      {:call, op} -> call(op, ev)
      {:def, [{:call, name} | opts]} -> %{ev | defs: Dict.put(ev.defs, name, opts)}
      _ -> raise InvalidWord, word: token
    end
  end

  @spec call(String.t, evaluator) :: evaluator
  def call(op, ev) do
    case Dict.get(ev.defs, op, nil) do
      nil -> %{ev | stack: primitive(op, ev.stack)}
      ops -> Enum.reduce(ops, ev, &execute/2)
    end
  end

  @spec primitive(String.t, List.t) :: List.t
  def primitive(op, stack) do
    case op do
      "+" -> case stack do
        [x, y | zs] -> [y+x | zs]
        _ -> raise StackUnderflow
      end
      "-" -> case stack do
        [x, y | zs] -> [y-x | zs]
        _ -> raise StackUnderflow
      end
      "*" -> case stack do
        [x, y | zs] -> [y*x | zs]
        _ -> raise StackUnderflow
      end
      "/" -> case stack do
        [x, _ | _] when x == 0 -> raise DivisionByZero
        [x, y | zs] -> [div(y, x) | zs]
        _ -> raise StackUnderflow
      end
      "dup" -> case stack do
        [x | zs] -> [x, x | zs]
        _ -> raise StackUnderflow
      end
      "drop" -> case stack do
        [_ | zs] -> zs
        _ -> raise StackUnderflow
      end
      "swap" -> case stack do
        [x, y | zs] -> [y, x | zs]
        _ -> raise StackUnderflow
      end
      "over" -> case stack do
        [x, y | zs] -> [y, x, y | zs]
        _ -> raise StackUnderflow
      end
      _ -> raise UnknownWord, word: op
    end
  end

  @spec parse(List.t, List.t) :: List.t
  defp parse(s, tokens \\ []) do
    case s do
      [":" | ss] -> 
        {ss, ts} = parse(ss)
        parse(ss, [{:def, ts} | tokens])
      [";" | ss] -> {ss, Enum.reverse(tokens)}
      [x | xs] -> parse(xs, [atom(x) | tokens])
      [] -> Enum.reverse(tokens)
    end
  end

  @spec atom(String.t) :: token
  def atom(s) do
    case Integer.parse(s) do
      {val, _} -> {:int, val}
      :error -> {:call, s}
    end
  end

  @doc """
  Return the current stack as a string with the element on top of the stack
  being the rightmost element in the string.
  """
  @spec format_stack(evaluator) :: String.t
  def format_stack(ev) do
    ev.stack |> Enum.reverse
             |> Enum.map(&to_string/1)
             |> Enum.intersperse(" ")
             |> to_string
  end
end
