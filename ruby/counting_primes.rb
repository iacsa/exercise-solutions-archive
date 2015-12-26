require 'prime'
IO.foreach(ARGV[0]){|line|
  a, b = line.split(",").map(&:to_i)
  puts Prime.each(b).to_a.size - Prime.each(a-1).to_a.size
}
