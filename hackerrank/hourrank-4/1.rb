guest_count = gets.to_i

arrivals = gets.split.map(&:to_i)

waiting = 0
time = 1

arrivals.each do |a_time|
  if time < a_time
    waiting = [waiting - (a_time - time), -1].max
    time = a_time
  end
  waiting += 1
end

puts time + waiting
