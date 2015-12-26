IO.foreach(ARGV[0]){|line|
  if (line =~ /\A(?<p>\(\g<p>*\)|\[\g<p>*\]|{\g<p>*})*$/).nil?
    puts "False"
  else
    puts "True"
  end
}
