# Solution uses Prim's MST Algorithm

function w (edge)
  edge[3]
end

function MST (V, E)
  T = [pop!(V)]
  sort!(E, by=w)
  result = {}
  while !isempty(V)
    for edge in E
      if edge[1] in T && edge[2] in V
        push!(T, edge[2])
        deleteat!(V, findfirst(V, edge[2]))
        push!(result, edge)
        break
      end
      if edge[2] in T && edge[1] in V
        push!(T, edge[1])
        deleteat!(V, findfirst(V, edge[1]))
        push!(result, edge)
        break
      end
    end
  end
  result
end

V = [1:40]
E = {}
# Read in data
file = open("network.txt")
content = readchomp(file)
lines = split(content, "\r\n")
for i in 1:40
  tokens = split(lines[i], ',')
  for j in 1:40
    weight = int(tokens[j])
    if weight > 0
      push!(E, [i, j, weight])
    end
  end
end

M = MST(V, E)
WM = reduce((acc, edge) -> acc + w(edge), 0, M)
WE = reduce((acc, edge) -> acc + w(edge), 0, E)
println(WE/2 - WM)
