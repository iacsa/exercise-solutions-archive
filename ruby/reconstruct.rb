IO.foreach(ARGV[0]){|line|
  words, hints = line.split(";").map(&:split)
  hints = hints.map(&:to_i)
  hints << (1..words.size).inject(:+) - hints.inject(:+)
  puts hints.map.with_index.sort_by(&:first).map{|i, idx| words[idx]}.join(" ")
}
