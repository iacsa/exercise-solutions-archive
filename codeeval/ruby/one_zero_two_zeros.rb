# ONE ZERO, TWO ZEROS...
#
# Given i and j, output the count of numbers not exceeding j, which have i
# zeros in their binary representation 

IO.foreach(ARGV[0]) do |line|
  zero_count, maximum = line.split.map(&:to_i)

  # Not in the mood for combinatorics, let's brute force it
  puts (1 .. maximum).count{|x| x.to_s(2).chars.count('0') == zero_count }
end
