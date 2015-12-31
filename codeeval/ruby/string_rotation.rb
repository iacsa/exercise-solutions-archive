IO.foreach(ARGV[0]){|line|
  a, b = line.chomp.split(",").map(&:chars).map(&:to_a)
  catch :true do
    a.size.times{(puts "True"; throw :true) if a == b.rotate!}
    puts "False"
  end
}
