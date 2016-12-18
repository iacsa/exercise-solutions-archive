module BookKeeping
  VERSION = 2
end

class TwelveDays
  VERSION = 1

  Items = [
    "a Partridge in a Pear Tree",
    "two Turtle Doves, and",
    "three French Hens,",
    "four Calling Birds,",
    "five Gold Rings,",
    "six Geese-a-Laying,",
    "seven Swans-a-Swimming,",
    "eight Maids-a-Milking,",
    "nine Ladies Dancing,",
    "ten Lords-a-Leaping,",
    "eleven Pipers Piping,",
    "twelve Drummers Drumming,"
  ]
  Numbers = [
    "first", "second", "third", "fourth",
    "fifth", "sixth", "seventh", "eighth",
    "ninth", "tenth", "eleventh", "twelfth"
  ]

  def self.song
    12.times.map do |i|
      "On the #{Numbers[i]} day of Christmas my true love gave to me, "\
      "#{Items[0..i].reverse.join(" ")}.\n"
    end.join("\n")
  end
end
