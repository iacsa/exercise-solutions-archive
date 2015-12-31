last = nil
symbols = ["\\", "|", "/"]
IO.foreach(ARGV[0]){|line|
  index = line.index("C") || line.index("_")
  line[index] = last.nil? ? "|" : symbols[(last <=> index)+1]
  puts line
  last = index
}
