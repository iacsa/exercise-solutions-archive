puts IO.foreach(ARGV[0]).map(&:to_i).reduce(0, :+)
