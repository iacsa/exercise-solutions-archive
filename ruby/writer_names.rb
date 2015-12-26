IO.foreach(ARGV[0]){|line|
  code , key = line.split("|")
  puts key.split.map(&:to_i).map{|i| code[i-1] }.join
}
