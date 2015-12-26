class Trinary
  attr_reader :to_decimal
  def initialize (str)
    @to_decimal = str.to_i(3)
  end
end
