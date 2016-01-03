input_count = gets.to_i

def win(zero, one, two)
  if zero.even?
    one.odd? || two.odd?
  else
    win(0, one, two)
  end
end

input_count.times do

  length = gets.to_i
  arr = gets.split.group_by{|num| num.to_i % 3 }
  
  zero = arr[0].nil? ? 0 : arr[0].size
  one = arr[1].nil? ? 0 : arr[1].size
  two = arr[2].nil? ? 0 : arr[2].size

  puts win(zero, one, two) ? "Balsa" : "Koca"
end
