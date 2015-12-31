IO.foreach(ARGV[0]){|line|
  line = line.split(/[;,]/).map(&:to_i)
  nums, x = line[0, line.size-1], line[-1]
  i, j = 0, nums.size - 1
  result = []
  case nums[i] + nums[j] <=> x
  when  1 then j -= 1
  when -1 then i += 1
  else
    result << "#{nums[i]},#{nums[j]}"
    i += 1
    j -= 1
  end while i < j
  puts (result.size > 0 ? result.join(";") : "NULL")
}
