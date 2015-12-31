require "rsa"

class Triplet
  def initialize (a, b, c)
    @a, @b, @c = a, b, c
  end
  def sum
    @a + @b + @c
  end
  def product
    @a * @b * @c
  end
  def pythagorean?
    @a**2 + @b**2 == @c**2
  end
  
  def self.where (opts)
    min = (opts[:min_factor] ||  1).to_f
    max = (opts[:max_factor] || 10).to_f
    sum = opts[:sum]

    (1..max).each_with_object([]) do |k, triples|
      mmin = Math.sqrt(min / k).ceil  # a >= min
      mmax = Math.sqrt(max / k).floor # b <= max

      (mmin..mmax).each do |m|
        nmin = (m / (1 + Math.sqrt(2))).ceil  # b >= a
        nmax = [
          Math.sqrt(m**2 - min / k), # a >= min
          Math.sqrt(max / k - m**2)  # c <= max
        ].min.floor

        (nmin..nmax).select{|n| RSA::Math.coprime?(m, n)}.each do |n|
          a = k*(m**2 - n**2)
          b = k*(2*m*n)
          c = k*(m**2 + n**2)
          triples.push(Triplet.new(a, b, c)) if !sum || a + b + c == sum
        end
      end
    end
  end
end
