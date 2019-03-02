function should_be_tested (perm)
  x = 0
  len = length(perm)
  for i in 1:len
    x += perm[i]
    if x > 0
      return true
    end
  end
  false
end
M = 12
count = 0
for N in 4:2:M
  partial_count = 0
  A = [ones(Int64, div(N, 2)-1), -ones(Int64, div(N,2))]
  for x in Set(permutations(A))
    if should_be_tested(x)
      partial_count += 1
    end
  end
  X = binomial(M, N)
  count += binomial(M, N) * partial_count
  println(X)
  println(partial_count)
  println(X*partial_count)
  println()
end
println(count)
