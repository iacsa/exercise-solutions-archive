# DOUBLE TROUBLE
#
# A correct line is the concatenation of two equal parts. Asterisks are
# wildcards (either A or B). Count the number of different ways to complete
# each line.

IO.foreach(ARGV[0]) do |line|
  s1, s2 = line.strip.chars.each_slice(line.size / 2).to_a
  puts s1.zip(s2).reduce(1){|acc, cs|
    n = cs.count("*")
    if n == 0
      break 0 unless cs[0] == cs[1]
      n += 1
    else n
    end * acc
  }
end
