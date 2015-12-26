class BeerSong
  def verse (n)
    "#{bottles(n).capitalize} on the wall, "\
    "#{bottles(n)}.\n" +
    if n == 0
      "Go to the store and buy some more, "\
    else
      "Take #{n == 1 ? "it" : "one"} down and pass it around, "\
    end +
    "#{bottles((n - 1) % 100)} on the wall.\n"
  end
  def bottles (n)
    "#{n == 0 ? "no more" : n} bottle#{n == 1 ? "" : "s"} of beer"
  end
  def verses (n, m)
    n.downto(m).map do |i|
      verse(i) + "\n"
    end.join
  end
  def sing
    verses(99, 0)
  end
end
