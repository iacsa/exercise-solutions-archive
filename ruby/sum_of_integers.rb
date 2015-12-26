IO.foreach(ARGV[0]).map{|l| l.split(",").map(&:to_i)}.map{|l|
  puts (0...l.size).collect_concat{|i|
    (1..(l.size-i)).collect{|j|
      l[i, j].reduce(:+)
    }
  }.max
}
