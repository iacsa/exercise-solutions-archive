IO.foreach(ARGV[0]){|line|
  nums = line.split(",").map(&:to_i)
  cnt = 0
  (0...nums.size).each{|i| (0...i).each{|j| (0...j).each{|n| (0...n).each{|m|
    cnt += 1 if nums[i] + nums[j] + nums[m] + nums[n] == 0
  }}}}
  puts cnt
}
