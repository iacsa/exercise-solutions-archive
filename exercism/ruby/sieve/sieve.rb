module BookKeeping
  VERSION = 1
end

class Sieve
  attr_reader :primes

  def initialize(limit)
    sieve = Array.new(limit + 1, true)
    @primes = []

    2.upto(limit) do |candidate|
      if sieve[candidate]
        @primes << candidate
        candidate.step(limit, candidate) do |multiple|
          sieve[multiple] = false
        end
      end
    end
  end
end
