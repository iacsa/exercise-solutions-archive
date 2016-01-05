def fac(n)
      (1 .. n).reduce(1, :*)
end

# The recursive solution is the simplest
def permutation(arr, n)
  return arr if n.zero?

  k = fac(arr.size - 1)

  [arr.delete_at(n / k)] + permutation(arr, n % k)
end

input_count = gets.to_i

input_count.times do
  # Our "first" permutation is 0
  n = gets.to_i - 1

  puts permutation("abcdefghijklm".chars, n).join
end
