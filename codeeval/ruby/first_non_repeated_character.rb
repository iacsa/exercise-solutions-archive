IO.foreach(ARGV[0]){|line| puts line.chars.select{|i| line.count(i) == 1}[0]}
