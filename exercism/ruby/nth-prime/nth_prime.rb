class Prime
  def self.nth(n)
    first(n).last
  end

  def self.first(n)
    raise ArgumentError if n <= 0
    primes = [2]
    k = 3
    while primes.size < n
      primes << k unless primes.any?{|p| k % p == 0 }
      k += 2
    end
    primes
  end
end
