# BLACK CARD
#
# Find the winner of variant of the "Josephus problem".
# Every nth player leaves the game, who is the last one left?

# The easiest solution is to reduce the problem recursively
def winner(players, which)
  if players == 1
    # The last player left always wins
    0
  else
    # Solve the problem with one less player and then shift the result to
    # account for the first "death"
    sub_winner = winner(players - 1, which)
    sub_winner + (sub_winner < (which % players) ? 0 : 1)
  end
end

IO.foreach(ARGV[0]) do |line|
  players, n = line.split("|")
  players = players.split

  # Subtract one from n because Ruby's array are 0-based, the game 1-based
  puts players[winner(players.size, n.to_i - 1) % players.size]
end
