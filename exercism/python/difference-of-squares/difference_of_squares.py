def power_sum(n, inner, outer):
  return sum([x ** inner for x in range(n + 1)]) ** outer

def square_of_sum(n):
  return power_sum(n, 1, 2)

def sum_of_squares(n):
  return power_sum(n, 2, 1)

def difference(n):
  return square_of_sum(n) - sum_of_squares(n)
