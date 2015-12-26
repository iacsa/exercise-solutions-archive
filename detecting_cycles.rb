IO.foreach(ARGV[0]){|line| puts line.match(/(?<!\p{Graph})(.+?) \1(?!\p{Graph})/)[1]}
