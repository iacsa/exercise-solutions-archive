count = gets.to_i

count.times do
  _, length = gets.split
  digits = gets.chomp.chars.map(&:to_i)
  products = digits.each_cons(length.to_i).map{|chunk| chunk.reduce(:*) }
  puts products.max
end
