IO.foreach(ARGV[0]){|line|
  n, m = line.split(",").map{|str| str.to_i}
  puts n % m
}
