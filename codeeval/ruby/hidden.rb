IO.foreach(ARGV[0]){|line|
  decoded = line.each_char.map{|c|
    case c.ord
    when "a".ord.."j".ord then (c.ord - "a".ord).to_s
    when "0".ord.."9".ord then c
    else ""
    end
  }.join
  puts decoded == "" ? "NONE" : decoded
}
