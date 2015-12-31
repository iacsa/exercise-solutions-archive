n, lines = nil, []
IO.foreach(ARGV[0]){|l| if n.nil? then n = l.to_i else lines << l end }
puts lines.map{|l| [l.size, l]}.sort_by(&:first).reverse.take(n).map(&:last)
