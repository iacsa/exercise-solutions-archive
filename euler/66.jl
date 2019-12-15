function minimal_solution_x (D)
  println(D)
  x = 2
  y = 1
  while true
    c = cmp(x^2 - D * y^2, 1)
    if c == 0
      return x
    elseif c == 1
      y = y + 1
    else
      x = x + 1
    end
  end
end
Ds = filter(D -> !(D in map(x -> x^2, 2:100)), 2:1000)
@time (Ds = map(D -> [D, minimal_solution_x(D)], Ds))
println(Ds[indmax(map(x -> x[2], Ds))][1])
