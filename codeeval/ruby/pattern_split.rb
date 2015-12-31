IO.foreach(ARGV[0]){|line|
  numbers,  pattern = line.split
  idx = pattern.index(/[\+\*-\/]/)
  num1, num2 = numbers[0...idx].to_i, numbers[idx...numbers.size].to_i
  puts pattern[idx].to_sym.to_proc.call(num1, num2)
}
