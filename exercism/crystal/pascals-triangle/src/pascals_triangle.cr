class PascalsTriangle

  def self.rows(n)
    raise ArgumentError.new("Row number must be non-negative.") if n < 0
    return [] of Array(Int32) if n == 0
    (1 ... n).reduce([[1]] of Array(Int32)) do |rows, _|
      rows << ([0] + rows.last + [0]).each_cons(2).map{|(x, y)| x + y}.to_a
    end
  end
end
