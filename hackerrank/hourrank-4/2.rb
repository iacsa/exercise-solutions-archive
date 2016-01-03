input_count = gets.to_i

input_count.times do
  length = gets.to_i

  arr = gets.split.map(&:to_i)

  swaps = arr.each_with_index.map{|n, i| (i ... arr.size).count{|m| arr[m] < n} }
  #puts arr.combination(2).count{|n, m| n > m }

  if swaps.any?{|k| k > 2 }
    puts "Too chaotic"
  else
    puts swaps.reduce(:+)
  end
end
