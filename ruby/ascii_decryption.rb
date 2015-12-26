def decode (n, code)
  code.map{|c| (c - n).chr}.join
end
IO.foreach(ARGV[0]){|line|
  n, last, code = line.split("|")
  i, n, code, last = 0, n.to_i, code.split.map(&:to_i), last.strip
  regex = "((?<![[:alpha:]]).{#{n-1}}#{last}(?![[:alpha:]])).*" + '\1'
  message = decode(i += 1, code) until message =~ /#{regex}/
  puts message
}
