input_count = gets.to_i

input_count.times do
  n = gets.to_i
  digit_sum = (2 ** n).to_s.chars.reduce(0){|sum, c| sum + c.to_i }
  puts digit_sum
end
