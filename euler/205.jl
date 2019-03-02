# Problem 205 - Dice Game
#
# Peter has nine four-sided (pyramidal) dice, each with faces numbered 1, 2, 3, 4.
# Colin has six six-sided (cubic) dice, each with faces numbered 1, 2, 3, 4, 5, 6.
#
# Peter and Colin roll their dice and compare totals: the highest total wins.
# The result is a draw if the totals are equal.
#
# What is the probability that Pyramidal Pete beats Cubic Colin? Give your
# answer rounded to seven decimal places in the form 0.abcdefg

# A closed analytic solution is not possible, but small discrete problems like
# this can be computed directly.

counts = zeros(2, 36)
for a in 1:4, b in 1:4, c in 1:4, d in 1:4, e in 1:4, f in 1:4, g in 1:4, h in 1:4, i in 1:4
  counts[1, a + b + c + d + e + f + g + h + i] += 1
end
for a in 1:6, b in 1:6, c in 1:6, d in 1:6, e in 1:6, f in 1:6
  counts[2, a + b + c + d + e + f] += 1
end

ways_to_win = 0
for pete in 1 : 36
  for colin in 1 : (pete - 1)
    ways_to_win += counts[1, pete] * counts[2, colin]
  end
end

println(round(ways_to_win / (4^9 * 6^6), 7))
