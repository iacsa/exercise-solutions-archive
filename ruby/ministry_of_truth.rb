def strike (orig, goal, res = [])
  if goal.empty?
    if orig.empty?
      return res.join(" ")
    else
      res << ("_" * orig.shift.size)
      return strike(orig, goal, res)
    end
  end
  return "I cannot fix history" if orig.empty?
  ow, gw = orig.shift, goal[0]
  if ow =~ /#{gw}/
    idx = ow =~ /#{gw}/
    res << ("_" * idx + gw + "_" * (ow.size - gw.size - idx))
    goal.shift
    strike(orig, goal, res)
  else
    res << ("_" * ow.size)
    strike(orig, goal, res)
  end
end

IO.foreach(ARGV[0]){|line|
  orig, goal = line.split(";")
  puts strike(orig.split, goal.split)
}
