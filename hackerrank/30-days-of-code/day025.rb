require "prime"

input_count = gets.to_i

input_count.times do
  input = gets.to_i
  puts input.prime? ? "Prime" : "Not prime"
end
