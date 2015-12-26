require 'enumerator'
IO.foreach(ARGV[0]){|line|
  binary, abs = line.split
  regex = ""
  (binary+"1").chars.each_cons(2){|i, j|
    case i+j
    when "11" then regex << "(A|A+(?!A)|B+(?!B)|B)"
    when "10" then regex << "(B+(?!B)|A)"
    when "01" then regex << "(A+(?!A)|A)"
    when "00" then regex << "A"
    end
  }
  puts (abs =~ /\A#{regex}\z/ ? "Yes" : "No")
}
