require 'pp'
IO.foreach(ARGV[0]){|line|
  n, m = line.split.map(&:to_i)
  locked = (m > 1) ? ((n-1) / 2 - (n-1) / 6) : 0
  locked += (n-1) / 3 - (n-1) / 6 if m.even?
  locked += 1 if n % 6 == 0 or (n % 3 == 0 and m.odd?) or (n.odd? and n % 3 > 0)
  puts n - locked
}
