module Squares
  def self.square_of_sum(n)
    power_sum(n, 1, 2)
  end
  def self.sum_of_squares(n)
    power_sum(n, 2, 1)
  end
  def self.difference_of_squares(n)
    square_of_sum(n) - sum_of_squares(n)
  end

  private def self.power_sum(n, inner, outer)
    (1 .. n).map{|k| k ** inner}.sum ** outer
  end
end
