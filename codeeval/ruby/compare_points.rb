LOOK_UP = {
  [0, 0] => "here",
  [0, 1] => "N",
  [0, -1] => "S",
  [1, 0] => "E",
  [1, 1] => "NE",
  [1, -1] => "SE",
  [-1, 0] => "W",
  [-1, 1] => "NW",
  [-1, -1] => "SW",
}

IO.foreach(ARGV[0]) do |line|
  x1, y1, x2, y2 = line.split.map(&:to_i)
  puts LOOK_UP[[(x2 - x1) <=> 0, (y2 - y1) <=> 0]]
end
