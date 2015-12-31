IO.foreach(ARGV[0]){|line|
  num, a, b = line.chomp.split(",").map(&:to_i)
  puts (num / 2**(a-1) % 2) == (num / 2**(b-1) % 2)
}
