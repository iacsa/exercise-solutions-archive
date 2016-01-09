def find_gcd(a, b)
  if a.zero?
    b
  else
    find_gcd(b % a, a)
  end
end

a, b = gets.split.map(&:to_i)
puts find_gcd(a, b)
