fibs = [0, 1]
IO.foreach(ARGV[0]).map(&:to_i).each{|n|
  fibs << fibs[-1] + fibs[-2] while fibs.size <= n
  puts fibs[n]
}
