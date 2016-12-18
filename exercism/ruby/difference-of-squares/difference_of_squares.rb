module BookKeeping
  VERSION = 3
end

class Squares

  def initialize(n)
    @n = n
  end

  def sum_of_squares
    power_sum(2, 1)
  end

  def square_of_sum
    power_sum(1, 2)
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private
  def power_sum(inner, outer)
    (1 .. @n).reduce(0) { |sum, x| sum + x ** inner } ** outer
  end
end
