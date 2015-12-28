class Hamming
  def Hamming.compute(s1, s2)
    if s1.size > s2.size
      Hamming.compute(s2, s1)
    else
      s1.chars.zip(s2.chars).count{|c1, c2| c1 != c2 }
    end
  end
end
