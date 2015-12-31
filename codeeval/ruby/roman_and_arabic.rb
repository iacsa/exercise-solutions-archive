require 'enumerator'

values = {
  "M" => 1000, "CM" => 900, "D" => 500, "CD" => 400,
  "C" => 100, "XC" => 90, "L" => 50, "XL" => 40,
  "X" => 10, "IX" => 9, "V" => 5, "IV" => 4,
  "I" => 1}

IO.foreach(ARGV[0]){|line|
  ar_pairs = line.strip.chars.each_slice(2).map{|a, r|
    [a.to_i, values[r]]
  }
  puts ar_pairs.each_cons(2).map {|ar1, ar2|
    (ar1.last < ar2.last ? -1 : 1) * ar1.reduce(:*)
  }.reduce(0, :+) + ar_pairs.last.reduce(:*)
}
