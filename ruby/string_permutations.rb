IO.foreach(ARGV[0]){|line|
  puts line.chomp.chars.to_a.permutation.map(&:join).uniq.sort.join(",")
}
