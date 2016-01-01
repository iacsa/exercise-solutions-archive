require 'prime'

primes = Prime.first(10000)

count = gets.to_i

count.times do
  n = gets.to_i
  puts primes[n - 1]
end
