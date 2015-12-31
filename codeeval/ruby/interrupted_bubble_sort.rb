def bubble_iter arr
  (1...arr.size).each do |i|
    arr[i], arr[i-1] = arr[i-1], arr[i] if arr[i-1] > arr[i]
  end
  arr
end

File.open(ARGV[0]).each{|line|
  *arr, iter = line.chomp.split(/[| ]+/).map(&:to_i)
  ([iter, arr.size].min).times do
    arr = bubble_iter(arr)
  end
  puts arr.join(" ")
}
