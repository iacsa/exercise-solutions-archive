require 'prime'

input_count = gets.to_i

def biggest_prime_factorial_below(n)
  prod = 1

  for p in Prime.each
    if prod * p < n
      prod *= p
    else
      return prod
    end
  end
end

input_count.times do
  limit = gets.to_i

  puts biggest_prime_factorial_below(limit)
end
