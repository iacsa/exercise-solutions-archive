IO.foreach(ARGV[0]){|line|
  n, list = line.split(";")
  seen = Array.new(n.to_i-1, false)
  list.split(",").map(&:to_i).each { |i|
    if seen[i] then puts i ; break else seen[i] = true end
  }
}
