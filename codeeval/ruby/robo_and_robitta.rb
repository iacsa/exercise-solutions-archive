# TRY TO SOLVE IT
#
# Starting at the top left and spiraling clockwise, after how many steps is the
# target square reached?

def steps(size_x, size_y, x, y)
  # If the target square is on the first line, the solution is simple
  if y == size_y then x
  # If it's somewhere else, we reduce the problem recursively
  else size_x + steps(size_y - 1, size_x, size_y - y, x)
  end
end

IO.foreach(ARGV[0]) do |line|
  puts steps(*line.split(/[^\d]+/).map(&:to_i))
end
