IO.foreach(ARGV[0]){|line|
  a, n = line.split.map(&:to_i)
  x, seen = a, []
  (seen << x; x = (x * a) % 10) until seen.member?(x)
  counts = Array.new(10, 0)
  seen.each{|i| counts[i] = n / seen.size}
  (0...(n % seen.size)).each{|i| counts[seen[i]] += 1}
  puts (0..9).map{|i| "#{i}: #{counts[i]}"}.join(", ")
}
