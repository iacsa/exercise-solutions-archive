# MAGIC NUMBERS
#
# Count the magic numbers in the given range (inclusive).

def magic?(n)
  # No repeating digits
  return false if n.chars.to_a.uniq.size < n.size
  # Hits all digits when cycling through
  idx = 0
  visited = []
  n.size.times do |i|
    idx = (idx + n[idx].to_i) % n.size
    visited << n[idx]
  end
  visited.uniq.size == n.size
end

IO.foreach(ARGV[0]) do |line|
  lower, upper = line.split
  magic_numbers = (lower .. upper).select{|n| magic?(n)}
  puts magic_numbers.empty? ? "-1" : magic_numbers.join(" ")
end
