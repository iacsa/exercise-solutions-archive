class Integer
  def palindrome?
    as_string = self.to_s
    as_string == as_string.reverse
  end
end

class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @min, @max = min_factor, max_factor
  end
  def generate
    @pals = (@min .. @max).to_a.repeated_combination(2)
                          .select{|i, j| (i * j).palindrome? }
                          .group_by{|i, j| i * j }
  end
  def largest
    Palindrome.new(*@pals.max_by{|k, _| k })
  end
  def smallest
    Palindrome.new(*@pals.min_by{|k, _| k })
  end
end

class Palindrome
  attr_reader :value, :factors
  def initialize(v, fs)
    @value = v
    @factors = fs
  end
end
