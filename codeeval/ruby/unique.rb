IO.foreach(ARGV[0]){|line| puts line.chomp.split(",").uniq.join(",")}
