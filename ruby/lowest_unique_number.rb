File.open(ARGV[0]).map(&:split).each{|nums|
  puts (nums.index(nums.select{|i| nums.count(i) == 1}.sort[0]) || -1) + 1
}
