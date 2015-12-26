code = " rqeutblxvknmcpsdoywafizjgh"
text = " tzojwhgmpiblernskafycdquvx"
dict = {}
code.chars.zip(text.chars).each{|c, t| dict[c] = t}

IO.foreach(ARGV[0]){|line|
  puts line.each_char.collect{|c| dict[c]}.join
}
