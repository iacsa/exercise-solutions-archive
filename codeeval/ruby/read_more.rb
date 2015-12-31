File.open(ARGV[0]).each_line do |line|
  if line.size > 55
    line = line[0...40]
    if / / =~ line
      line = line[0...line.rindex(" ")]
    end
    line = line + "... <Read More>"
  end
  puts line
end
