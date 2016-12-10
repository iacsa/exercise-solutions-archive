class Series
  @sequence : Array(Int64)

  def initialize(sequence)
    if /\A\d*\Z/ =~ sequence
      @sequence = sequence.chars.map(&.to_i64)
    else
      raise ArgumentError.new("Sequence must consist only of digits.")
    end
  end

  def largest_product(span)
    if span == 0
      1
    elsif span < 0
      raise ArgumentError.new("Span must be non-negative")
    elsif span > @sequence.size
      raise ArgumentError.new("Span must be size of sequence or shorter.")
    else
      @sequence.each_cons(span).map{|seq| seq.product}.max
    end
  end
end
