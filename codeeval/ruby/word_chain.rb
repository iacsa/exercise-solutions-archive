def build_chain (chain, words)
  if chain.empty?
    words.map{|w| build_chain([w], words)}.max
  else
    candidates = words.select{|w| not chain.member?(w) and w[0] == chain[-1][-1]}
    if candidates.empty?
      chain.size
    else
      candidates.map{|w| build_chain(chain + [w], words)}.max
    end
  end
end

IO.foreach(ARGV[0]){|line|
  words = line.chomp.split(",")
  n = build_chain([], words)
  puts (n == 1 ? "None" : n)
}
