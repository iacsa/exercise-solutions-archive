require 'prime'

class PrimeFactors
  def self.for(n)
    Prime.prime_division(n).flat_map{|p, n| [p] * n }
  end
end
