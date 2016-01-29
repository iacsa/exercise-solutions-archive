input_count = gets.to_i

input_count.times do
  input = gets.chomp
  reverse = input.reverse

  funny = (1 ... input.size).all? do |i|
    (input[i].ord - input[i - 1].ord).abs ==
      (reverse[i].ord - reverse[i - 1].ord).abs
  end

  puts funny ? "Funny" : "Not Funny"
end
