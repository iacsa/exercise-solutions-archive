module Primes
  def self.sieve(limit)
    primes = Array(Int32).new
    candidates = Array.new(limit + 1, true)

    2.upto(limit) do |p|
      if candidates[p]
        primes << p

        p.upto(limit / p) do |k|
          candidates[k * p] = false
        end
      end
    end

    primes
  end
end
