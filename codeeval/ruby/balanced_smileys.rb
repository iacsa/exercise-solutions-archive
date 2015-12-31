IO.foreach(ARGV[0]){|line|
  if (line =~ /^(?<p>:\)|:\(|[a-z :]+(?![a-z ])|\(\g<p>*\))*$/).nil?
    #puts "#{line.chomp} =NO"
    puts "#{line.chomp} =NO"
  else
    #puts "#{line.chomp} =YES"
    puts "YES"
  end
}
