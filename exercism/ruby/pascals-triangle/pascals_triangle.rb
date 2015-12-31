class Triangle
  attr_reader :rows

  def initialize(n)
    @rows = [[1]]
    n.pred.times{|k| @rows << next_row }
  end

private

  def next_row
    ([0] + @rows.last + [0]).each_cons(2).map{|x, y| x + y }
  end
end
