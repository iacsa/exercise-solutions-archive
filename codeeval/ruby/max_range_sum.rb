# MAX RANGE SUM
#
# Find the maximum sum of a subrange of length n.

IO.foreach(ARGV[0]) do |line|
  n, numbers = line.split(";")
  n, numbers = n.to_i, numbers.split.map(&:to_i)

  # Initialize accumulator with first subrange sum
  max_sum = (0 ... n).reduce(0){|acc, i| acc + numbers[i]}

  # Walk through remaining subranges, using the fact that we can efficiently
  # compute the new sum based on the old.
  # Unfortunately, there's no Enumerable#scan :-(
  (n ... numbers.size).reduce(max_sum) do |sum, i|
    new_sum = sum - numbers[i - n] + numbers[i]
    max_sum = new_sum if new_sum > max_sum
    new_sum
  end

  # If only negative sums, output 0 instead.
  puts [max_sum, 0].max
end
