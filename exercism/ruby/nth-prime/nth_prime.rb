class Prime
  def self.nth(n)
    raise ArgumentError if n <= 0

    # Some very conservative upper bound for our sieve
    limit = 13 + (3.8 * n * Math.log(n)).ceil

    found = 0
    sieve = Array.new(limit + 1, true)

    2.upto(limit) do |candidate|
      next unless sieve[candidate]

      found += 1
      return candidate if found == n

      candidate.step(limit, candidate) do |multiple|
        sieve[multiple] = false
      end
    end
  end
end
