should = %w(aaaaaaaaa aaaaaaaad aaaaaaaag aaaaaaaaj aaaaaaabc aaaaaaabf aggjjaaga beaajbihg bhdgffhfa dbceeabih dcbhgjaaf dgifecchi djacfjbae eacccdjeh eedfbcedb hbefebhfi hehcijfhc ibjbeigac ihifdbhhf jaffigdad jfdhdeice)

should_not = %w(aaaaaaaaf aaaaaaaai aaaaaaaba aaaaaaabb aaaaaaabe abijjabda bhgjfacgi bbcafhcif bfjhehbcf cfjbaijad dddbgcgai diieabefh ehhieihhh ehigcbgjd fdbgidjdj haebgiggc hfjciccbi hgjdeajec ifbjdgibf jhjcaeead jhdibgbfj)

regex = /aa([dgj]|a$|b[cf])|bh[^g]|ce|cc[^b]|ja[^bd]|hehc|beig/


for word in should
  unless regex =~ word
    puts "#{word} is not recognized"
  end
end

puts

for word in should_not
  if regex =~ word
    puts "#{word} slips through"
  end
end

map = Hash.new{|h, k| h[k] = 0 }

for word in should
  unless regex =~ word
    word.chars.each_cons(2) do |c1, c2|
      map[c1+c2] += 1
    end
  end
end

p map.select{|k, v| v > 2 }
