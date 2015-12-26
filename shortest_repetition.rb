IO.foreach(ARGV[0]){|line| puts line.match(/^(.+?)\1*$/)[1].size}
