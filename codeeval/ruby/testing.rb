# TESTING
#
# Depending on the hamming distance of two strings, categorize the differences.

IO.foreach(ARGV[0]) do |line|
  # Extract the two words and convert to char arrays
  w1, w2 = line.split("|").map(&:strip)

  # Make sure w1 is not longer than w2 to avoid additional nils from zip
  w1, w2 = w2, w1 if w1.size > w2.size
  distance = w1.chars.zip(w2.chars).count{|c1, c2| c1 != c2}

  puts case distance
  when 0 then "Done"
  when 1 .. 2 then "Low"
  when 3 .. 4 then "Medium"
  when 5 .. 6 then "High"
  else "Critical"
  end
end
