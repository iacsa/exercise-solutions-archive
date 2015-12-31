def intersect (a, b)
  if a.max < b.begin or a.max < b.begin
    nil
  else
    [a.begin, b.begin].max..[a.max, b.max].min
  end
end
IO.foreach(ARGV[0]){|line|
  xs = line.split(",").map(&:to_i)
  if intersect(xs[0]..xs[2], xs[4]..xs[6]).to_a.empty? or
      intersect(xs[3]..xs[1], xs[7]..xs[5]).to_a.empty?
    puts "False"
  else puts "True" end
}
