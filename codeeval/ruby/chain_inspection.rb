IO.foreach(ARGV[0]){|chain|
  links = chain.chomp.split(";").map{|l| l.split("-")}
  chain, link = {}, "BEGIN"
  links.each{|l| chain[l[0]] = l[1]}
  chain.size.times{link = chain[link]}
  puts (link == "END" ? "GOOD" : "BAD")
}
