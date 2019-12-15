function is_square (x)
  y = int(sqrt(x))
  x == y * y
end
function is_prime_plus_double_square (x)
  for p in primes(x)
    if is_square((x - p) / 2)
      return true
    end
  end
  false
end

for n in 1:9999
  m = 2 * n + 1
  if !isprime(m) && ! is_prime_plus_double_square(m)
    println(m)
    break
  end
end
