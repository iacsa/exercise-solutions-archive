require "date"

actual = Date.new(*gets.split.map(&:to_i).reverse)
expected = Date.new(*gets.split.map(&:to_i).reverse)

puts case
when actual <= expected
  0
when actual.year > expected.year
  10000
when actual.month > expected.month
  (actual.month - expected.month) * 500
else
  (actual.day - expected.day) * 15
end 
