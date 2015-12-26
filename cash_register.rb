values = {
  'ONE HUNDRED' => 10000, 'FIFTY' => 5000, 'TWENTY' => 2000,
  'TEN' => 1000, 'FIVE' => 500, 'TWO' => 200,
  'ONE' => 100, 'HALF DOLLAR' => 50, 'QUARTER' => 25,
  'DIME' => 10, 'NICKEL' => 5, 'PENNY' => 1
}
IO.foreach(ARGV[0]){|line|
  pp, cg = line.split(";").map(&:to_f)
  if pp > cg
    puts "ERROR"
  elsif pp == cg
    puts "ZERO"
  else
    left = ((cg - pp) * 100).round
    puts values.each.collect_concat{|name, val|
      result = []
      while left >= val
        result << name
        left -= val
      end
      result
    }.join(",")
  end
}
