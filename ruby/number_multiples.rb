puts File.open(ARGV[0]).map{|l| l.split(",").map(&:to_i)}.map{|k, a| (k+a-1)/a*a}
