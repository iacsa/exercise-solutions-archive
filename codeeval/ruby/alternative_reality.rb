# ALTERNATIVE REALITY
#
# Count the number of different way a sum can be reached by summing coins.

CHANGE = [50, 25, 10, 5]

def change(sum, coin = 0)
  return 0 if sum < 0
  return 1 if coin == CHANGE.size
  change(sum, coin + 1) + change(sum - CHANGE[coin], coin)
end

IO.foreach(ARGV[0]) do |line|
  puts change(line.to_i)
end
