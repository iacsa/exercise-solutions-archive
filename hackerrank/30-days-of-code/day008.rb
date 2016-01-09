input_count = gets.to_i

phone_book = {}

input_count.times do
  name = gets.chomp
  number = gets.chomp

  phone_book[name] = number
end

names = gets(nil).split("\n")

names.each do |name|
  puts phone_book.has_key?(name) ? "#{name}=#{phone_book[name]}" : "Not found"
end
