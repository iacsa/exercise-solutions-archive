IO.foreach(ARGV[0]){|line|
  counts = Array.new(26, 0)
  line.downcase.chars.each{|c|
    counts[c.ord-"a".ord] += 1 if c =~ /[a-z]/
  }
  puts counts.sort!.reverse!.each_with_index.map{|c, i|
    c * (26 - i)
  }.reduce(:+)
}
