let square_of_sum (n: int) : int =
  (n + 1) * (n + 1) * n * n / 4

let sum_of_squares (n: int) : int =
  (2 * n + 1) * (n + 1) * n / 6

let difference_of_squares (n: int) : int =
  square_of_sum n - sum_of_squares n
