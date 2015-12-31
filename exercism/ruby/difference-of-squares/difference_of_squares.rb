class Squares
  VERSION = 1
  def initialize (n)
    @n = n
  end
  def sum_of_squares
    power_sum(1, 2)
  end
  def square_of_sums
    power_sum(2, 1)
  end
  def difference
    square_of_sums - sum_of_squares
  end

  private
  def power_sum (a, b)
    (1..@n).reduce{|a, i| a + i ** b} ** a
  end
end
