function reverse (n)
  x = 0
  for d in digits(n)
    x = x * 10 + d
  end
  x
end

function all_odd_digits (n)
  all(map(isodd, digits(n)))
end

x = 0
@time for n in 1:999999999
  r = reverse(n)
  if ndigits(r, 10) == ndigits(n, 10) && all_odd_digits(n + reverse(n))
    x = x + 1
  end
end
println(x)
