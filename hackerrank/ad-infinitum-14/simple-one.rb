require 'rational'
MOD = 10 ** 9 + 7
class SimpleOne
  def initialize(p, q, n)
    @old = Rational(p, q)
    @n = n
  end
  def result
    tan(@n)
  end
  def tan(n)
    return @old if n == 1
    res = 0
    if n.even?
      t1 = tan(n / 2)
      res = 2 * t1 / (1 - t1 ** 2)
    else
      t1 = tan(n - 1)
      res = (t1 + @old) / (1 - t1 * @old)
    end
    Rational(res.numerator % MOD, res.denominator % MOD)
  end
end
def extended_gcd(a, b)
  u, v, s, t = 1, 0, 0, 1
  while b > 0
    q = a / b
    a, b = b, a - q * b
    u, s = s, u - q * s
    v, t = t, v - q * t
  end
  u
end
input_count = gets.to_i
input_count.times do
  p, q, n = gets.split.map(&:to_i)
  so = SimpleOne.new(p, q, n)
  result = so.result
  a, b = result.numerator, result.denominator
  b_inv = extended_gcd(b, MOD)
  result = (a * b_inv) % MOD
  puts result
end
