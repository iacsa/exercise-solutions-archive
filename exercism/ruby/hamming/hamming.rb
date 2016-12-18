module BookKeeping
  VERSION = 3
end

module Hamming
  def Hamming.compute(s1, s2)
    raise ArgumentError unless s1.size == s2.size
    s1.chars.zip(s2.chars).count { |c1, c2| c1 != c2 }
  end
end
