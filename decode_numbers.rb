def decode (str)
  l = str.size
  if l <= 1
    1
  else
    case str[0]
    when "0" then 0
    when "1" then decode(str[1,l-1]) + decode(str[2,l-2])
    when "2"
      if (0..6).member?(str[1].to_i)
        decode(str[1,l-1]) + decode(str[2,l-2])
      else
        decode(str[1,l-1])
      end
    else
      decode(str[1,l-1])
    end
  end
end

IO.foreach(ARGV[0]){|line|
  puts decode(line.chomp)
}
