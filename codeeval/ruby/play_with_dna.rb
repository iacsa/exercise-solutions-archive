def ldist (first, second)
  matrix = [(0..first.length).to_a]
  (1..second.length).each do |j|
    matrix << [j] + [0] * (first.length)
  end
  (1..second.length).each do |i|
    (1..first.length).each do |j|
      if first[j-1] == second[i-1]
        matrix[i][j] = matrix[i-1][j-1]
      else
        matrix[i][j] = [
          matrix[i-1][j],
          matrix[i][j-1],
          matrix[i-1][j-1],
        ].min + 1
      end
    end
  end
  return matrix.last.last
end

IO.foreach(ARGV[0]){|line|
  pat, n, str = line.split
  n = n.to_i
  matches = (0..(str.size - pat.size)).map{|i|
    sub = str[i, pat.size]
    [ldist(sub, pat), sub]
  }.select{|d, s| d <= n}.sort
  if matches.empty?
    puts "No match"
  else
    puts matches.map(&:last).join(" ")
  end
}
