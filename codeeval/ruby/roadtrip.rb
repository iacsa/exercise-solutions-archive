IO.foreach(ARGV[0]){|line|
  d = (line.split(/;\s/).map!{|i| i.split(",")[1].to_i} << 0).sort!
  puts d.each_cons(2).map{|i, j| (i-j).abs}.join(",")
}
