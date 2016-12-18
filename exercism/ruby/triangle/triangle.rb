module BookKeeping
  VERSION = 1
end

class TriangleError < ArgumentError
end

class Triangle
  def initialize(sides)
    @sides = sides
  end

  def kind
    unless @sides.all? { |l| l.positive? && 2 * l < @sides.reduce(:+) }
      return :illegal
    end
    case @sides.uniq.size
    when 1 then :equilateral
    when 2 then :isosceles
    when 3 then :scalene
    end
  end

  def equilateral?
    kind == :equilateral
  end

  def isosceles?
    [:isosceles, :equilateral].include?(kind)
  end

  def scalene?
    kind == :scalene
  end
end
