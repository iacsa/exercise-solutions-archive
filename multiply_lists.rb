IO.foreach(ARGV[0]){|line|
  list1, list2 = line.split("|").map(&:split)
  puts list1.zip(list2).map{|a, b| a.to_i * b.to_i}.join(" ")
}
