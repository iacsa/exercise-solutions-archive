values = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}
File.open(ARGV[0]).map(&:to_i).each{|n|
  puts values.map{|sign, val| cnt, n = n.divmod(val); sign * cnt }.join
}
