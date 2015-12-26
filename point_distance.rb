IO.foreach(ARGV[0]){|line|
  x1, x2, y1, y2 = line.scan(/(?:-)?[[:digit:]]+/).map(&:to_i)
  puts Math.sqrt((x1 - y1)**2 + (x2 - y2)**2).to_i
}
