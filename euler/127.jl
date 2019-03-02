function rad (x)
  prod(keys(factor(x)))
end

function abc_hit (a, b, c)
  gcd(a, c) == 1 &&
  rad(a * b * c) < c &&
  gcd(a, b) == 1 && gcd(b, c) == 1
end

acc = 0
for c in 2:119999
  if rad(c) == c
    continue
  end
  for a in 1:div(c - 1, 2)
    b = c - a
    if abc_hit(a, b, c)
      println([a, b, c])
      acc += c
    end
  end
end

println(acc)
