require 'prime'

limit = gets.to_i

max_digits = (0 .. 8).select{|k| 10 ** k - 1 >= limit }.first

sum = Prime.each(limit).select do |prime|
  (1 .. max_digits).all?{|i| prime.to_s.chars.rotate(i).join.to_i.prime? }
end.reduce(0, :+)

puts sum
