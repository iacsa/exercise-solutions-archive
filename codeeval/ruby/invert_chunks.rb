require 'enumerator'
IO.foreach(ARGV[0]){|line|
  list, n = line.split(";")
  puts list.split(",").each_slice(n.to_i).map{|l|
    l.size == n.to_i ? l.reverse : l
  }.join(",")
}
