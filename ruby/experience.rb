months = {"Jan" => 0, "Feb" => 1, "Mar" => 2, "Apr" => 3,
          "May" => 4, "Jun" => 5, "Jul" => 6, "Aug" => 7,
          "Sep" => 8, "Oct" => 9, "Nov" => 10, "Dec" => 11}
IO.foreach(ARGV[0]){|line|
  worked = Array.new(31*12, 0)
  line.split(";").each{|interval|
    start, stop = interval.split("-").map{|date|
      month, year = date.split
      months[month] + 12 * (year.to_i - 1990)
    }
    (start..stop).each{|i| worked[i] = 1 }
  }
  puts worked.reduce(:+) / 12
}
