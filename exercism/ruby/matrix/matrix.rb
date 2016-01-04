class Matrix

  def initialize(str)
    @mat = str.split("\n").map do |row|
      row.split.map(&:to_i)
    end
  end

  def rows
    @mat
  end

  def columns
    @mat.transpose
  end
end
