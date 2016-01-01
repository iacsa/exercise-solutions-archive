class Triplet

  def initialize(a, b, c)
    @a, @b, @c = a, b, c
  end

  def sum
    @a + @b + @c
  end

  def product
    @a * @b * @c
  end

  def pythagorean?
    @a ** 2 + @b ** 2 == @c ** 2
  end
  
  # Using Euclid's formula
  def self.where(min_factor: 1, max_factor: 10, sum: nil)
    one_plus_sqrt_two = 1 + Math.sqrt(2)

    (1 .. max_factor).each_with_object([]) do |k, triples|

      max_over_k = max_factor.to_f / k
      min_over_k = min_factor.to_f / k

      m_min = Math.sqrt(min_over_k).ceil # a >= min_factor
      m_max = Math.sqrt(max_over_k).floor # b <= max_factor

      m_min.upto(m_max) do |m|
        m2 = m * m

        n_min = (m / one_plus_sqrt_two).ceil # b >= a
        n_max = [
          Math.sqrt(m2 - min_over_k), # a >= min_factor
          Math.sqrt(max_over_k - m2) # c <= max_factor
        ].min.floor

        n_min.upto(n_max) do |n|
          next if m.gcd(n) > 1 # m and n must be coprime
          n2 = n * n

          a = k * (m2 - n2)
          b = k * (2 * m * n)
          c = k * (m2 + n2)
          triples << Triplet.new(a, b, c) if sum.nil? || a + b + c == sum
        end
      end
    end
  end
end
