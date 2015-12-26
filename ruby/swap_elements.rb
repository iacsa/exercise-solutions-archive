IO.foreach(ARGV[0]){|line|
  list, patterns = line.split(":")
  list = list.split
  patterns.split(",").each{|pattern|
    a, b = pattern.split("-").map(&:to_i)
    list[a], list[b] = list[b], list[a]
  }
  puts list.join(" ")
}
