# KNIGHT MOVES
#
# Find the squares a knight on the given square can jump to

IO.foreach(ARGV[0]) do |line|
  col, row = line.strip.split("")

  # Just generate all 8 knight jumps using the symmetries
  squares = [-1, 1].flat_map do |mirror_row|
    [-1, 1].flat_map do |mirror_col|
      [1, 2].map do |row_distance|
        col_distance = 3 - row_distance
        [
          (col.ord + col_distance * mirror_col).chr,
          (row.ord + row_distance * mirror_row).chr
        ]
      end
    end
  # Now filter out legal squares
  end.select do |col, row|
    ("a" .. "h").include?(col) && ("1" .. "8").include?(row)
  end.map(&:join)

  # Sort alphabetically and return on one line
  puts squares.sort.join(" ")
end
