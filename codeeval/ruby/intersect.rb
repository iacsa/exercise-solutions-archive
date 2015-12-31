require 'set'
IO.foreach(ARGV[0]){|line|
  left, right = line.split(";").map{|set| Set.new(set.split(",").map(&:to_i))}
  puts left.intersection(right).sort.map(&:to_s).join(",")
}
