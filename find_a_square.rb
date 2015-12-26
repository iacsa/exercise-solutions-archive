def orthogonal? (v, u)
  return false if v[0] == 0 and v[1] == 0
  return false if u[0] == 0 and u[1] == 0
  return v[0] * u[0] + v[1] * u[1] == 0
end
def d (x, y)
  (x[0] - y[0])**2 + (x[1] - y[1])**2
end
def square_angle? (x, y, z)
  return false unless d(x, y) == d(x, z)
  orthogonal?([x[0]-y[0], x[1]-y[1]],[x[0]-z[0], x[1]-z[1]])
end

IO.foreach(ARGV[0]){|line|
  ps = line.scan(/(?:\()(-?\d+,)(-?\d+\))/).map{|x| x.map(&:to_i)}
  puts (if square_angle?(ps[0], ps[1], ps[2])
    square_angle?(ps[1], ps[3], ps[0]) and square_angle?(ps[2], ps[3], ps[0]) 
  elsif square_angle?(ps[0], ps[1], ps[3])
    square_angle?(ps[1], ps[2], ps[0]) and square_angle?(ps[3], ps[2], ps[0]) 
  elsif square_angle?(ps[0], ps[2], ps[3])
    square_angle?(ps[2], ps[1], ps[0]) and square_angle?(ps[3], ps[1], ps[0]) 
  else false end)
}
