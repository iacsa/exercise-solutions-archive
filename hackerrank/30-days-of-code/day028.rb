input_count = gets.to_i

input_count.times do
  begin
    Regexp.new(gets.chomp)
    puts "Valid"
  rescue
    puts "Invalid"
  end
end
