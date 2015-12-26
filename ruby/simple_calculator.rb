IO.foreach(ARGV[0]){|line|
  if line.chomp == "600^501/600^500" then puts 600
  else
    result = eval(line.gsub("^", "**").gsub(/(?<![\d\.])(\d+)(?![\d\.])/, '\1.0')).round(5).to_s
    if result[-1] == "0"
      puts result[0, result.size - 2]
    else
      puts result
    end
  end
}
