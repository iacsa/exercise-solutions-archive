function powerset (x)
  result = [IntSet()]
  for i in x, j = 1:length(result)
    push!(result, union(result[j], IntSet(i)))
  end
  result
end

function is_special_sum_set (A)
  B_sets = powerset(A)
  for B in B_sets
    if length(B) == 0
      continue
    end
    C_sets = powerset(setdiff(A, B))
    for C in C_sets
      if length(C) == 0 || length(C) > length(B)
        continue
      end
      if sum(B) == sum(C)
        return false
      end
      if length(B) > length(C) && sum(B) <= sum(C)
        return false
      end
    end
  end
  true
end

# Read in data
file = open("sets.txt")
content = readchomp(file)
lines = split(content, "\r\n")
sums = 0
for line in lines
  tokens = map(uint, split(line, ','))
  println(tokens)
  println(is_special_sum_set(tokens))
  if is_special_sum_set(tokens)
    sums += sum(tokens)
  end
end
println(sums)
