IO.foreach(ARGV[0]){|line|
  i = 0
  puts line.chars.map{|c|
    i += 1 if c =~ /[[:alpha:]]/
    i.odd? ? c.upcase : c.downcase
  }.join
}
