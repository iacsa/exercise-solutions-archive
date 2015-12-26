require 'prime'
first = nil
File.open(ARGV[0]).map(&:to_i).each{|n|
  if first
    if n <= 1 then puts 1
    else
      factors = n.prime_division.map{|p, e| [p % 4, e + 1]}
      if factors.select{|p, e| p == 3}.map(&:last).map(&:odd?).all?
        c = factors.select{|p, e| p == 1}.map(&:last).reduce(1, :*)
        c += 1 if factors.select{|p, e| p != 2}.map(&:last).map(&:odd?).all?
        puts c / 2
      else puts 0 end
    end
  else first = n end
}
