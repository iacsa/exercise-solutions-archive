# STRING MASK
#
# Transform the characters in a string to uppercase (1) or lowercase (0)
# according to a given bit mask. 1 

IO.foreach(ARGV[0]) do |line|
  word, mask = line.split.map(&:chars)
  puts word.zip(mask).map{|c, b| b == "1" ? c.upcase : c.downcase}.join
end
