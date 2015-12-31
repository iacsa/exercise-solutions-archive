triangle = IO.foreach(ARGV[0]).map{|line| line.split.map(&:to_i)}

(triangle.size-2).downto(0).each{|i|
  (0..i).each{|j|
    triangle[i][j] += [triangle[i+1][j], triangle[i+1][j+1]].max
  }
}
puts triangle[0][0]
