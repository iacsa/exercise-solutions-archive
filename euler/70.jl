##  Euler's Phi (or: totient) function
function eulerphi(n::Integer)
  for p in keys(factor(n))    # must be unique
    n = n - div(n, p)       # m = m * (1 - 1/p)
  end
  n
end

println(sum(map(eulerphi, 2:1000000)))
