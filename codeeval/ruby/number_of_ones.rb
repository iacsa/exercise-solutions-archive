File.open(ARGV[0]).map(&:to_i).each{|n|
  ones = 0
  (n, r = n.divmod(2); ones += r) while n > 0
  puts ones
}
