number_of_inputs = gets.to_i

number_of_inputs.times do
  limit = gets.to_i

  sum = 0
  n, m = 0, 2
  while m < limit
    sum += m
    n, m = m, 4 * m + n
  end

  puts sum
end
