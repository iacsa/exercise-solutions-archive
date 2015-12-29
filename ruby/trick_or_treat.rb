# TRICK OR TREAT
#
# Different costumes give different results on halloween from each house:
# Vampire = 3 candies, Zombie = 4 candies, Witch = 5 candies
#
# How many candies does each kid get, if they evenly divide all their candy?

IO.foreach(ARGV[0]) do |line|
  candy_per_house, houses, kid_count = 0, 0, 0

  line.split(", ").each do |pair|
    name, count = pair.split(": ")

    if name == "Houses"
      houses += count.to_i
    else
      kid_count += count.to_i
    end

    candy_per_house += count.to_i * case name
    when "Houses" then 0
    when "Vampires" then 3
    when "Zombies" then 4
    when "Witches" then 5
    end
  end

  # Truncate the result to an int
  puts (candy_per_house * houses.to_f / kid_count).to_i
end
