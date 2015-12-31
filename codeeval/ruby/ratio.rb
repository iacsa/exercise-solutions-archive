IO.foreach(ARGV[0]){|line|
  chars = line.chomp.chars
  upper, lower = 0, 0
  chars.each{|c| if c.downcase == c then lower += 1 else upper += 1 end }
  sum = (upper + lower) / 100.0
  puts "lowercase: %.2f uppercase: %.2f" % [lower / sum, upper / sum]
}
