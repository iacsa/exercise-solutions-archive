roots = {30 => [30], 8 => [8, 30], 52 => [52, 30], 3 => [3, 8, 30], 20 => [20, 8, 30], 10 => [10, 20, 8, 30], 29 => [29, 20, 8, 30]}
IO.foreach(ARGV[0]){|line|
  a, b = line.split.map(&:to_i)
  puts roots[a].select{|r| roots[b].member?(r)}[0]
}
