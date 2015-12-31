File.open(ARGV[0]).map(&:chomp).each{|n|
  puts n.to_i == n.chars.map{|i| i.to_i**n.size}.reduce(:+) ? "True" : "False"
}
