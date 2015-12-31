class ValueError < Exception
end

class Board
  def self.transform (board)
    raise ValueError unless valid?(board)

    (1 .. board.size-2).each_with_object(board)  do |y, board|
      (1 .. board.first.size-2).each do |x|
        unless board[y][x] == "*"
          mines = [-1, 0, 1].product([-1, 0, 1]).select do |dx, dy|
            board[y + dy][x + dx] == "*"
          end.size
          board[y][x] = mines.to_s if mines > 0
        end
      end
    end
  end

  def self.valid? (board)
    correct_size  = board.map(&:size).uniq.size == 1
    correct_chars = (0 ... board.size).map do |y|
      board[y] =~ (y % (board.size-1) == 0 ? /^\+\-*\+$/ : /^\|[\* ]*\|$/)
    end.all?

    correct_size && correct_chars
  end
end
