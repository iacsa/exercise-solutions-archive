# STRINGS AND ARROWS
#
# Find the number of occurences of '>>-->' and '<--<<'.

IO.foreach(ARGV[0]) do |line|
  # By using Enumerable#each_cons we can get all substrings of length 5, then
  # we can just count the arrows.
  puts line.strip.chars.each_cons(5).map(&:join).count{|substring|
    [">>-->", "<--<<"].include?(substring)
  }
end
