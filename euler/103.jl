function powerset(x)
  result = [IntSet()]
  for i in x, j = 1:length(result)
    push!(result, union(result[j], IntSet(i)))
  end
  result
end

function is_special_sum_set(A)
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

A = [11, 18, 19, 20, 22, 25] # optimal 6-SSS
middle = div(length(A), 2) + 1
A = [A[middle]; A + A[middle]]         # candidate for 7-SSS
B = A
while !is_special_sum_set(B) || length(Set(B)) < length(A)
  B = copy(A)
  # Randomly modify candidate and test for specialness
  delta = rand(Int32, length(A)) % 5
  B = A + delta
end
print("Problem 103: ")
for b in B
  print(b)
end
println()
