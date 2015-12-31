IO.foreach(ARGV[0]){|line|
  puts line.split.map(&:to_f).sort.map{|x| "%.3f" % x}.join(" ")
}
