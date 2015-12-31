require 'enumerator'

IO.foreach(ARGV[0]){|line|
  xs = line.split.map(&:to_i)
  l, d, bp = xs[0], xs[1], xs[3, xs.size-3]
  bp << (6 - d) << (l + d - 6)
  puts bp.sort.each_cons(2).map{|a, b|
    (b - a) / d - 1
  }.reduce(0, :+)
}
