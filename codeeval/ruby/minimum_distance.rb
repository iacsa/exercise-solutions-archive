# MINIMUM DISTANCE
#
# Output the minimum absolute distance a point can have from the given points

IO.foreach(ARGV[0]) do |line|
  # First item is just the number of points, we don't need it
  points = line.split.map(&:to_i)[1 .. -1]

  # The median always minimizes p-1 norm
  x = points.sort[points.size / 2]

  # Calculate and print overall distance
  puts points.map{|y| (x - y).abs }.reduce(:+)
end
