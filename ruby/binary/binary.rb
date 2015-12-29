class Binary
  VERSION = 1
  attr_reader :to_decimal
  def initialize str
    @to_decimal = str.chars.reduce(0) do |acc, d|
      raise ArgumentError if "01".index(d).nil?
      2 * acc + d.to_i
    end
  end
end
