IO.foreach(ARGV[0]){|line|
  seconds = (line.to_f * 3600).to_i
  minutes, seconds = seconds / 60, seconds % 60
  degrees, minutes = minutes / 60, minutes % 60

  puts "%d.%02d'%02d\"" % [degrees, minutes, seconds]
}
