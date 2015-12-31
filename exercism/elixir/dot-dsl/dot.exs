defmodule Graph do
  defstruct attrs: [], nodes: [], edges: []
end

defmodule Dot do
  defmacro graph(ast) do
    {attrs, nodes, edges} = parse({[], [], []}, ast)
    quote do
      graph = %Graph{
        attrs: unquote(Enum.sort(attrs)),
        nodes: unquote(Enum.sort(nodes))
      }
      unquote(edges)
        |> Enum.sort
        |> Enum.reverse
        |> Enum.reduce(graph, fn(e, g) ->
        case e do
          [a, b, info] -> %{g | edges: [{a, b, info} | g.edges]}
          _ -> g
        end
      end)
    end
  end

  defp parse(lists, ast) do
    case ast do
      {:do, ast} -> lists |> parse(ast)
      {:__block__, _, block} -> lists |> parse(block)
      {:--, _, info} -> lists |> parse_edge(info)
      {:graph, _, info} -> lists |> parse_attr(info)
      [{:graph, _, _}, a] when is_list(a) -> raise ArgumentError
      {_, _, _} -> lists |> parse_node(ast)
      [hd | tl] -> lists |> parse(hd) |> parse(tl)
      [] -> lists
      nil -> lists
      _ -> raise ArgumentError
    end
  end

  defp parse_attr({attrs, nodes, edges}, info) do
    case info do
      [[info]] -> {[info | attrs], nodes, edges}
      [[]] -> {attrs, nodes, edges}
      _ -> raise ArgumentError
    end
  end

  defp parse_node({attrs, nodes, edges}, {node, _, info}) do
    {attrs, [{node, parse_info(info)} | nodes], edges}
  end

  defp parse_edge({attrs, nodes, edges}, e) do
    case e do
      [{n1, _, _}, {n2, _, info}] -> {attrs, nodes, [[n1, n2, parse_info(info)] | edges]}
      _ -> raise ArgumentError
    end
  end
  defp parse_info(info) do
    case info do
      [info] -> if Keyword.keyword?(info), do: info, else: raise ArgumentError
      nil -> []
      _ -> raise ArgumentError
    end
  end
end
