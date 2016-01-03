def digit_sum(n)
  n.to_s.each_char.reduce(0){|sum, c| sum + c.to_i }
end

def factorial(n)
  1.upto(n).reduce(1, :*)
end

input_count = gets.to_i

input_count.times do
  n = gets.to_i

  puts digit_sum(factorial(n))
end
