function prob (round, b, p)
  if round > 15
    if b >= 8
      p
    else
      0
    end
  else
    prob(round + 1, b + 1, p / (round + 1)) +
    prob(round + 1, b    , p / (round + 1) * round)
  end
end

println(int(floor(1 / prob(1, 0, 1))))
