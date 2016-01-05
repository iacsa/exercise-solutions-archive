input_count = gets.to_i

input_count.times do

  n = gets.to_i

  triangle = n.times.map do
    gets.split.map(&:to_i)
  end

  row = triangle.pop

  until triangle.empty? do
    next_row = triangle.pop
    row = next_row.map.with_index do |x, i|
      x + [row[i], row[i + 1]].max
    end
  end

  puts row.first
end
