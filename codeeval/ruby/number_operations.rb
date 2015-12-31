# NUMBER OPERATIONS
#
# Determine if one can produce 42 by subtracting, adding and multiplying the
# given numbers.

def fit(numbers)
  numbers.permutation.any? do |n1, n2, n3, n4, n5|
    [:+, :-, :*].repeated_permutation(4).any? do |op1, op2, op3, op4|
      n1.send(op1, n2.send(op2, n3.send(op3, n4.send(op4, n5)))) == 42
    end
  end
end

IO.foreach(ARGV[0]) do |line|
  numbers = line.split.map(&:to_i)
  puts fit(numbers) ? "YES" : "NO"
end
