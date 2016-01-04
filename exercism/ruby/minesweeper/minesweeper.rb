class ValueError < Exception
end

class Board

  def self.transform(board)
    raise ValueError unless valid?(board)

    # Valid coordinate indices, leave out the border
    x_range = (1 .. board.first.size - 2).to_a
    y_range = (1 .. board.size - 2).to_a

    x_range.product(y_range) do |x, y|

      # Don't annotate squares with mines
      next if board[y][x] == "*"

      # Count neighboring mines. No need to check indices, there
      # is a border surrounding the board.
      mines = [-1, 0, 1].repeated_permutation(2).count do |dx, dy|
        board[y + dy][x + dx] == "*"
      end

      # Leave squares without neighboring mines empty
      board[y][x] = mines.to_s if mines > 0
    end

    board
  end

  def self.valid?(board)

    # All rows must have the same length
    correct_size = board.map(&:size).uniq.size == 1

    correct_chars = (0 ... board.size).map do |y|
      # Top and bottom rows differ from inner rows
      board[y] =~ (y % (board.size - 1) == 0 ? /^\+\-*\+$/ : /^\|[\* ]*\|$/)
    end.all?

    correct_size && correct_chars
  end
end
