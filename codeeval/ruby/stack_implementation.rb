IO.foreach(ARGV[0]){|line|
  stack = []
  line.split.map(&:to_i).each{|e| stack.push(e)}
  result = "#{stack.pop}"
  until stack.empty? do
    stack.pop
    result += " #{stack.pop}"
  end
  puts result
}
