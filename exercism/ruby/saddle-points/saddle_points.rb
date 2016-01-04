class Matrix

  def initialize (str)
    @mat = str.split("\n").map do |row|
      row.split.map(&:to_i)
    end
    @m, @n = @mat.size, @mat.first.size
  end

  def rows
    @mat
  end

  def columns
    @mat.transpose
  end

  def saddle_points
    (0 ... @m).to_a.product((0 ... @n).to_a).select do |i, j|
      saddle?(i, j)
    end
  end

  def saddle?(i, j)
    v = @mat[i][j]
    v == rows[i].max && v == columns[j].min
  end
end
