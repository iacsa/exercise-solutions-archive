puts File.open(ARGV[0]).map(&:to_i).map{|n| n.to_s(2)}
