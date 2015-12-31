# TIME TO EAT
#
# Sort timestamps (HH:MM:SS) in descending order

IO.foreach(ARGV[0]) do |line|
  times = line.split

  # The timestamps actually sort into the same order as the numbers you get by
  # removing the colons. But sorting in Ruby is always ascending, so we need to
  # negate the resulting number.
  sorted_times = times.sort_by{|time| -time.gsub(":", "").to_i }

  puts sorted_times.join(" ")
end
