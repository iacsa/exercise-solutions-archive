require 'set'
File.open(ARGV[0]).map(&:to_i).each{|n|
  visited = Set.new
  while n > 1 and not visited.member?(n)
    visited << n
    n = n.to_s.chars.map{|c| c.to_i}.map{|i| i*i}.reduce(:+)
  end
  puts n == 1 ? "1" : "0"
}
