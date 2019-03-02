##  Euler's Phi (or: totient) function
function eulerphi (n::Integer)
  for p in keys(factor(n))    # must be unique
    n = n - div(n, p)       # m = m * (1 - 1/p)
  end
  n
end
function eulerphirat (n)
  n / eulerphi(n)
end

println(indmax(map(eulerphirat, 2:1000000)) + 1)
