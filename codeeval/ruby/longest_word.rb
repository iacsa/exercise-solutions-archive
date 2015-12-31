IO.foreach(ARGV[0]){|l| puts l.split.reduce{|a, w| a.size < w.size ? w : a}}
