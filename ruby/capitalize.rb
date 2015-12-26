IO.foreach(ARGV[0]){|line|
  last, out = " ", ""
  line.each_char.each{|c|
    out << (last == " " ? c.upcase : c)
    last = c
  }
  puts out
}
