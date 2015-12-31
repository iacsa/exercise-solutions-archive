board = Array.new(256){Array.new(256, 0)}
IO.foreach(ARGV[0]){|line|
  command, i, x = line.split
  i, x = [i, x].map(&:to_i)
  case command
  when "SetCol"   then (0...256).each{|j| board[j][i] = x}
  when "SetRow"   then (0...256).each{|j| board[i][j] = x}
  when "QueryCol" then puts (0...256).reduce(0){|sum, j| sum + board[j][i]}
  when "QueryRow" then puts (0...256).reduce(0){|sum, j| sum + board[i][j]}
  end
}
