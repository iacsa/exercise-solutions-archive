class Queens

  def initialize (white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black

    @w_row, @w_file = white
    @b_row, @b_file = black
  end

  def white
    [@w_row, @w_file]
  end

  def black
    [@b_row, @b_file]
  end

  def to_s
    board = Array.new(8){ ["_"] * 8 }

    board[@w_row][@w_file] = "W"
    board[@b_row][@b_file] = "B"

    board.map{|row| row.join(" ") }.join("\n")
  end

  def attack?
    delta_row = (@w_row - @b_row).abs
    delta_file = (@w_file - @b_file).abs

    delta_row.zero? || delta_file.zero? || delta_row == delta_file
  end
end
