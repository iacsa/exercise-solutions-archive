IO.foreach(ARGV[0]){|line|
  hole, bricks = line.split("|")
  hole = hole.scan(/(?:\[)(-?\d+,)(-?\d+\])/).map{|x| x.map(&:to_i)}
  dims_hole = [hole[0][0] - hole[1][0], hole[0][1] - hole[1][1]].map(&:abs).sort
  bricks = bricks.split(";").map{|b| b.scan(/-?\d+/).map(&:to_i)}
  fitting = bricks.select{|b|
    dims = [b[1] - b[4], b[2] - b[5], b[3] - b[6]].map(&:abs).sort
    dims[0] <= dims_hole[0] and dims[1] <= dims_hole[1]
  }.map(&:first)
  puts (fitting.empty? ? "-" : fitting.sort.join(","))
}
