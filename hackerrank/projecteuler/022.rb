def name_score(name)
  name.each_char.reduce(0) do |sum, c|
    sum + c.ord
  end - ("A".ord - 1) * name.size
end


name_count = gets.to_i

names = name_count.times.map{ gets.chomp }.sort.each_with_index.to_a


query_count = gets.to_i

query_count.times do
  name = gets.chomp
  sorted_index = names.bsearch{|n, _| name <=> n }.last

  puts name_score(name) * (sorted_index + 1)
end
