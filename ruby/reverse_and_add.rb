File.open(ARGV[0]).map(&:to_i).each{|n|
  rev, iter = n.to_s.chars.to_a.reverse.join.to_i, 0
  (n += rev; iter += 1; rev = n.to_s.chars.to_a.reverse.join.to_i) until n == rev
  puts "#{iter} #{n}"
}
