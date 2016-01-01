# Mostly based on exercism/palindrome-products

require 'set'

class Integer
  def palindrome?
    as_string = self.to_s
    as_string == as_string.reverse
  end
end

class Palindromes
  def self.generate(max_factor:, min_factor: 1)
    palindromes = Set.new
    (min_factor .. max_factor).to_a.repeated_combination(2) do |i, j|
      palindromes.add(i * j) if (i * j).palindrome?
    end
    palindromes.to_a
  end
end

# We actually need to sort descending for bsearch to work later
palindromes = Palindromes.generate(max_factor: 999, min_factor: 100).sort.reverse

count = gets.to_i

count.times do
  limit = gets.to_i
  puts palindromes.bsearch{|product| product < limit }
end
