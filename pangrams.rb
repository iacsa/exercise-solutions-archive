IO.foreach(ARGV[0]){|line|
  present = Array.new(26, false)
  line.chars.map(&:downcase).each{|c| present[c.ord-'a'.ord] = true if c =~ /[[:alpha:]]/}
  missing = present.each_with_index.collect{|p, i| p ? nil : (i+'a'.ord).chr}.join
  puts (missing == "" ? "NULL" : missing)
}
