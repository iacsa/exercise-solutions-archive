class Luhn
  attr_reader :addends

  def self.create(n)
    n * 10 + (-Luhn.new(n * 10).checksum % 10)
  end

  def initialize(n)
    @addends = []

    str = n.to_s
    str.size.downto(1) do |i|
      # Use negative indexing so that we can iterate forward,
      # and still know whether we are even or odd from the end
      x = str[-i].to_i
      x *= 2 if i.even?
      x -= 9 if x > 9
      @addends << x 
    end
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    (checksum % 10).zero?
  end
end
