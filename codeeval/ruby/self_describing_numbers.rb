IO.foreach(ARGV[0]){|n|
  puts (0...n.size).map{|i| n.count(i.to_s) == n[i].to_i}.all? ? "1" : "0"
}
