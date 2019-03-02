function is_power_sum (n)
  d = sum(digits(n))
  if d == 1
    return false
  end
  return prevpow(d, n) == n
end

i = 0
for n in 10:99999999999
  if is_power_sum(n)
    i = i + 1
    println([i, n])
    if i == 30
      println("Found: ", n)
    end
  end
end
