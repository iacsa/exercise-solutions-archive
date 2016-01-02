require 'prime'

# n < 10^6
N = 10 ** 6
primes = Prime.each(N)

# build prime sums
sum = [0]
p = 0

1.upto(N) do |k|
  if p <= k
    sum[k] = sum[k - 1] + p
    p = primes.next
  else
    sum[k] = sum[k - 1]
  end
end

count = gets.to_i

count.times do
  n = gets.to_i

  puts sum[n]
end
