# Problem 493 - Under The Rainbow
#
# 70 colored balls are placed in an urn, 10 for each of the seven rainbow
# colors.  What is the expected number of distinct colors in 20 randomly picked
# balls?  Give your answer with nine digits after the decimal point
# (a.bcdefghij).

# Not too hard with simple probability theory, no real programming involved.

println(round(7 * (1 - binomial(60, 20) / binomial(70, 20)), 9))
