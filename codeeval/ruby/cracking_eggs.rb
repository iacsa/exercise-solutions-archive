def height (eggs, throws)
  eggs = [eggs, throws].min
  if eggs == 1
    throws
  elsif eggs == 2
    (throws**2 + throws) / 2
  else
    (1..throws).map{|i| height(eggs - 1, i - 1)}.reduce(0, :+) + throws
  end
end
def throws (eggs, stories)
  i, h = 0, 0
  (i += 1; h = height(eggs, i)) until h >= stories
  i
end

IO.foreach(ARGV[0]){|line|
  eggs, stories = line.split.map(&:to_i)
#  p [eggs, stories, throws(eggs, stories), height(eggs, throws(eggs, stories))]
  puts throws(eggs, stories)
}
