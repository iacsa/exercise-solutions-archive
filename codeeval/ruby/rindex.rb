IO.foreach(ARGV[0]){|line|
  text, char = line.chomp.split(",")
  puts text.rindex(char) || -1 if text and char
}
