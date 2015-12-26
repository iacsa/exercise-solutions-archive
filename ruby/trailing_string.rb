IO.foreach(ARGV[0]){|line|
  c1, c2, r, p1, p2 = line.scan(/(?:-)?[[:digit:]\.]+/).map(&:to_f)
  puts (c1 - p1)**2 + (c2 - p2)**2 <= r**2
}
