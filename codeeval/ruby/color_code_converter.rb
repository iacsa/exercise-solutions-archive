IO.foreach(ARGV[0]){|line|
  rgb = case line[0]
        when "#" # Hex
          line.scan(/[[:alnum:]]{2}/).map{|t| t.to_i(16)}
        when "(" # CMYK
          c, m, y, k = line.scan(/[0-9\.]+/).map(&:to_f)
          [1 - c, 1 - m, 1 - y].map{|a| (a * (1 - k) * 255).round}
        when "H" # HSV or HSL
          h, s, x = line.scan(/\d+/).map(&:to_i)
          if line[2] == "V" # HSV
            s, v = s / 100.0, x / 100.0
            c = s * v
          else # HSL
            s, l = s / 100.0, x / 100.0
            c = s * (1 - (2 * l - 1).abs)
          end
          x = c * (1 - (h / 60.0 % 2 - 1).abs)
          rgb = case h / 60
                when 0 then [c, x, 0]
                when 1 then [x, c, 0]
                when 2 then [0, c, x]
                when 3 then [0, x, c]
                when 4 then [x, 0, c]
                when 5 then [c, 0, x]
                end
          if line[2] == "V" # HSV
            rgb.map{|a| ((a + v - c) * 255).round}
          else # HSL
            rgb.map{|a| ((a + l - c / 2) * 255).round}
          end
        end
  puts "RGB(#{rgb.join(",")})"
}
