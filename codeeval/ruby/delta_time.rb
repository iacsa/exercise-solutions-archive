File.open(ARGV[0]).each_line do |line|
  times = line.split.map do |time|
    Time.new(2014, 1, 1, *time.split(":").map(&:to_i))
  end
  delta = if times[0] < times[1]
    times[1] - times[0]
  else
    times[0] - times[1]
  end
  puts Time.at(delta).strftime("%H:%M:%S")
end
