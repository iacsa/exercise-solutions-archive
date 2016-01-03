stick_count = gets.to_i

sticks = gets.split.map(&:to_i).group_by{|k| k }

p sticks
