time = gets.strip

h, m, s = time.split(":").map(&:to_i)
h %= 12
h += 12 if time.end_with?("PM")

puts "%02d:%02d:%02d" % [h, m, s]
