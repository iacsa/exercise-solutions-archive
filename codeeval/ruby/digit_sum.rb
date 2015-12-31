IO.foreach(ARGV[0]){|line|
  puts line.chars.reduce(0){|sum, i| sum + i.to_i}
}
