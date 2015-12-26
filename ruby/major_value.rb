File.open(ARGV[0]).each_line do |line|
  counts = Array.new(101, 0)
  tokens = line.chomp.split(",")
  catch :found_major do
    tokens.each{|num_str|
      num = num_str.to_i
      counts[num] += 1
      if counts[num] > tokens.size / 2
        puts num
        throw :found_major
      end
    }
    puts "None"
  end
end
