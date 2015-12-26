require 'prime'
puts Prime.each(1000).to_a.reverse.select{|p| p.to_s == p.to_s.chars.reverse.join}.max
