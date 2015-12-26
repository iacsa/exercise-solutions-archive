require 'set'

def ld_is_one a, b
  return ld_is_one b, a if a.size > b.size
  ai, bi, diff = 0, 0, false
  while ai < a.size or bi < b.size
    if a[ai] != b[bi]
      return false if diff
      diff = true
      ai += 1 if a.size == b.size
    else ai += 1 end
    bi += 1
  end
  diff
end

seeds, dict, eoi = [], Array.new(50){[]}, false
File.open(ARGV[0]).map(&:chomp).each{|line|
  (eoi = true; next) if not eoi and line == "END OF INPUT"
  (eoi ? dict[line.size] : seeds) << line
}
(0...seeds.size).each do |i|
  new = found = Set.new([seeds[i]])
  found.merge(new = new.collect_concat{|s|
    (s.size-1..s.size+1).collect_concat{|l|
      dict[l].reject{|w| found.member?(w)}.select{|w| ld_is_one(s, w)}
    }
  }) while new.size > 0
  puts found.size
end
