# DETAILS
#
# Input are rows of a matrix. How many cells call the Y-shape be shifted to the
# left until it hits the X-shape?

# This is effectively asking:
# How far is the minimum distance of the last X and first Y over all rows?

IO.foreach(ARGV[0]) do |line|
  rows = line.strip.split(",")
  puts rows.map{|row|
    # If we don't have a detail, we need to account for the border
    last_x = row.rindex("X") || -1
    first_y = row.index("Y") || row.size
    first_y - last_x - 1
  }.min
end
