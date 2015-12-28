IO.foreach(ARGV[0]) do |line|
  matrix = line.split
  n = Math.sqrt(matrix.size).to_i

  new_matrix = (0 ... n).flat_map do |row|
    (0 ... n).map do |col|
      matrix[row + (n - 1 - col) * n]
    end
  end

  puts new_matrix.join(" ")
end
