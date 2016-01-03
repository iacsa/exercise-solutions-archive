count = gets.to_i
sum = 0

count.times do
      sum += gets.to_i
end

puts sum.to_s[0 .. 9]
