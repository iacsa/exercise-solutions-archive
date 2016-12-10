module Hamming
  def self.compute(s1, s2)
    if s1.size != s2.size
      raise ArgumentError.new("s1 and s2 must be of equal length.")
    end

    s1.chars.zip(s2.chars).count do |(c1, c2)|
      c1 != c2
    end
  end
end
