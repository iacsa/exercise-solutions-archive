class TriangleError < ArgumentError
end

class Triangle
  def initialize(a, b, c)
    @sides = [a, b, c]
    side_sum = @sides.reduce(:+)

    unless @sides.all?{|l| l.positive? && l < side_sum - l }
      raise TriangleError
    end
  end

  def kind
    case @sides.uniq.size
    when 1 then :equilateral
    when 2 then :isosceles
    when 3 then :scalene
    end
  end
end

