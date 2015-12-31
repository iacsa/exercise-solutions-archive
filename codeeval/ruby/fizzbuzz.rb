IO.foreach(ARGV[0]){|line|
  a, b, n = line.split.map{|i| i.to_i}
  puts (1..n).map{|i|
    i % a == 0 ? i % b == 0 ? "FB"
                            : "F"
               : i % b == 0 ? "B"
                            : i
  }.join(" ")
}
