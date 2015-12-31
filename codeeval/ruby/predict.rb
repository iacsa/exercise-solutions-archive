IO.foreach(ARGV[0]){|i| puts i.to_i.to_s(2).count("1") % 3}
