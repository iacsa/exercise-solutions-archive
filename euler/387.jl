# Problem 387 - Harshad Numbers
#

# A Harshad or Niven number is a number that is divisible by the sum of its
# digits.  201 is a Harshad number because it is divisible by 3 (the sum of its
# digits.) When we truncate the last digit from 201, we get 20, which is a
# Harshad number.  When we truncate the last digit from 20, we get 2, which is
# also a Harshad number.  Let's call a Harshad number that, while recursively
# truncating the last digit, always results in a Harshad number a right
# truncatable Harshad number.
# 
# Also: 201/3=67 which is prime.  Let's call a Harshad number that, when
# divided by the sum of its digits, results in a prime a strong Harshad number.
# 
# Now take the number 2011 which is prime.  When we truncate the last digit
# from it we get 201, a strong Harshad number that is also right truncatable.
# Let's call such primes strong, right truncatable Harshad primes.
# 
# You are given that the sum of the strong, right truncatable Harshad primes
# less than 10000 is 90619.
# 
# Find the sum of the strong, right truncatable Harshad primes less than 10^14.

# We use the recursive "right truncatable harshad number" definition to generate them bottom up.

function is_harshad(n)
  n % sum(digits(n)) == 0
end

function is_strong(n)
  isprime(div(n, sum(digits(n))))
end

N = 14

function generate_rthns(expt, acc)
  expt == N - 1 && return acc

  new_acc = []
  for n in acc, x_0 in 0:9
    y = n * 10 + x_0
    is_harshad(y) && push!(new_acc, y)
  end
  union(acc, generate_rthns(expt + 1, new_acc))
end

function generate_harshad_primes()
  strong_right_truncatables = filter(is_strong, generate_rthns(1, 1:9))
  result = []
  for harshad_number in strong_right_truncatables, x_0 in 0:9
    y = harshad_number * 10 + x_0
    isprime(y) && push!(result, y)
  end
  result
end

@time println(sum(generate_harshad_primes()))
