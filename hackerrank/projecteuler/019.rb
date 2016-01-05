require 'date'

input_count = gets.to_i

input_count.times do
  date = Date.new(*gets.split.map(&:to_i))
  end_date = Date.new(*gets.split.map(&:to_i))

  sum = 0

  # Count start date
  sum += 1 if date.mday == 1 && date.sunday? && date <= end_date

  # Set date to first day of next month
  date = (date - date.mday + 1).next_month

  # Count Sundays until end date
  while date <= end_date
    sum += 1 if date.sunday?
    date = date.next_month
  end

  puts sum
end
