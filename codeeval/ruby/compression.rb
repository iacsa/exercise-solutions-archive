IO.foreach(ARGV[0]){|line|
  last, count, out = nil, 0, []
  line.split.each{|num|
    if num == last then count += 1
    else
      out << count << last if not last.nil?
      count = 1
      last = num
    end
  }
  puts (out << count << last).join(" ")
}
