input = gets.chomp

matches = input.scan(/([[:alpha:]]+)/)

puts matches.size

matches.each do |word|
  puts word
end
