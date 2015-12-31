require 'enumerator'
IO.foreach(ARGV[0]){|line|
  xs = line.split.map(&:to_i)
  if xs[1, xs[0]].each_cons(2).map{|a, b| (a-b).abs}.sort == (1...xs[0]).to_a
    puts "Jolly"
  else
    puts "Not jolly"
  end
}
