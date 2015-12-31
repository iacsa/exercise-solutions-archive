puts File.open(ARGV[0]).map{|line| line.split[-2]}
