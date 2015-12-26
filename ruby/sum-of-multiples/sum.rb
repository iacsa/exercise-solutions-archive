class SumOfMultiples
  def initialize (*xs)
    @xs = xs
  end
  def self.to (n)
    self.new(3, 5).to(n)
  end
  def to (n)
    (1...n).select do |k|
      @xs.map{|i| (k % i).zero?}.any?
    end.reduce(0, :+)
  end
end
