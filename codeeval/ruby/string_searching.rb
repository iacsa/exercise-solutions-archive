IO.foreach(ARGV[0]){|line|
  str, pat = line.chomp.split(",")
  if str =~ /#{pat.gsub(/(?<!\\)\*/, ".*")}/
    puts "true"
  else
    puts "false"
  end
}
