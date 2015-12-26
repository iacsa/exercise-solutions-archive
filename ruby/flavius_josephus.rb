File.open(ARGV[0]).map(&:to_i).each{|depth|
  puts (0...depth).collect_concat{|n|
    (0..n).map{|k| (n-k+1..n).reduce(1, :*) / (2..k).reduce(1, :*)}
  }.join(" ")
}
