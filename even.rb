puts File.open(ARGV[0]).map{|i| i.to_i.even? ? "1" : "0"}
