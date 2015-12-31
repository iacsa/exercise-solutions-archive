File.open(ARGV[0]).each_line do |line|
  res = line[0]
  line.chars.each_cons(2) do |c1, c2|
    res += c2 if c1 != c2
  end
  puts res
end
