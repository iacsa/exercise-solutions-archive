P = primes(1000000)
println(length(P))
for i in 1:length(P)
  p = BigInt(P[i])
  r = mod((p - 1)^i + (p + 1)^i, p^2)
  if r > 10^10
    println([i, p, r])
    break
  end
end

