class Calculator

  def initialize
  end

  def power(n, p)
    raise ArgumentError.new("n and p should be non-negative") if n < 0 || p < 0
    n ** p
  end

end
