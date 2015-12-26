require 'prime'
puts File.open(ARGV[0]).map(&:to_i).map{|n| Prime.each(n-1).to_a.join(",")}
