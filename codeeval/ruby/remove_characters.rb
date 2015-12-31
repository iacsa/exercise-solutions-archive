IO.foreach(ARGV[0]){|line|
  str, chars = line.split(",").map(&:strip)
  puts str.gsub:Regexp.new("[#{chars}]"), "")
}
