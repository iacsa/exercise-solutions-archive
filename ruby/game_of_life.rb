# GAME OF LIFE
#
# From the input state, compute 10 iterations of the game of life.

DEAD_ALIVE = ".*"

# Read into array and convert to int for efficiency
state = File.open(ARGV[0]).map do |line|
  line.strip.tr(DEAD_ALIVE, "01").chars.map(&:to_i)
end

line_length = state.first.size

# Put into one-dimensional array for easier looping
state = state.flatten

10.times do
  state = state.map.with_index do |c, i|
    living_neighbors = (-1 .. 1).to_a.repeated_permutation(2).count do |dx, dy|
      neighbor = i + dx + dy * line_length
      # Check that we don't accidentally wrap around the board
      neighbor >= 0 && (i + dx) / line_length == i / line_length && state[neighbor] == 1
    end
    
    # Subtract the cell itself, it should not count towards alive neighbors
    {3 => 1, 2 => c}[living_neighbors - c] || 0
  end
end

state.each_slice(line_length) do |line|
  puts line.join.tr("01", DEAD_ALIVE)
end
