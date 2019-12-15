# Problem 206 - Concealed Square
#
# Find the unique positive integer whose square has the form
# 1_2_3_4_5_6_7_8_9_0, where each “_” is a single digit.

# We want x^2 == 1_2_3_4_5_6_7_8_9_0
# With x == sum_i x_i * 10^i
# Therefore
#   x_0^2 == _0 => x_0 = 0
# The rest we can brute force bottom up.

function digit_is(x, index, val)
  div(x % 10^(index + 1), 10^index) == val
end

function fully_valid(x)
  partially_valid(x, 9)
end

function partially_valid(x, length)
  y = x^2
  for i in 1 : length
    if !digit_is(y, i * 2, 10 - i)
      return false
    end
  end
  return true
end

function next_candidates(candidates, length)
  new_candidates = []
  for candidate in candidates, x_n in 0:99
    y = x_n * 10^(length * 2 - 1) + candidate
    if partially_valid(y, length)
      push!(new_candidates, y)
    end
  end
  if length == 9
    new_candidates
  else
    next_candidates(new_candidates, length + 1)
  end
end

function solution()
  filter(fully_valid, next_candidates([0], 1))
end

for sol in solution()
  println(sol, "^2 = " , sol^2)
end
