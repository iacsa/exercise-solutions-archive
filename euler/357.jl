# Problem 357 - Prime generating integers
#
# Consider the divisors of 30: 1,2,3,5,6,10,15,30.
# It can be seen that for every divisor d of 30, d+30/d is prime.
#
# Find the sum of all positive integers n not exceeding 100 000 000
# such that for every divisor d of n, d+n/d is prime.

# We want that for any factorization of n = d1 * d2, d1 + d2 is prime.
# It follow that n must:
# * Be odd, else n = n * 1 => n + 1 is even => n + 1 not prime (n == 1 is an exception)
# * Be not divisible by 4, else we find n = d1 * d2; d1, d2 both even => d1 + d2 even

N = 100000000

function generates_primes(n)
  n % 4 == 0 && return false
  for p in 1 : trunc(Int64, sqrt(n))
    d, r = divrem(n, p)
    (r == 0 && !isprime(p + d)) && return false
  end
  true
end

@time println("Sum is ", 1 + sum(filter(generates_primes, 2:2:N)))
