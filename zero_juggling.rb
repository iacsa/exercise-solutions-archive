File.open(ARGV[0]).each_line do |line|
  tokens = line.split()
  puts (0...tokens.size/2).inject(0){|acc, idx|
    factor = 2**tokens[2*idx+1].size
    acc * factor + (factor - 1) * (tokens[2*idx] == "00" ? 1 : 0)
  }
end
