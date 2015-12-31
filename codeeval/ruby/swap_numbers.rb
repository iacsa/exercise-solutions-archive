IO.foreach(ARGV[0]) do |line|
  puts line.split.map{|word| word[-1] + word[1 ... -1] + word[0] }.join(" ")
end
