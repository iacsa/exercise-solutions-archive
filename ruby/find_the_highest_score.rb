# FIND THE HIGHEST SCORE
#
# The input is a serialized table, rows are divided by a pipe "|". Output the
# maximum value for each column.

IO.foreach(ARGV[0]) do |line|
  rows = line.split("|").map{|row| row.split.map(&:to_i)}
  cols = rows.transpose
  puts cols.map(&:max).join(" ")
end
