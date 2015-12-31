File.open(ARGV[0]).map(&:split).each{|list| puts list[-list[-1].to_i-1]}
