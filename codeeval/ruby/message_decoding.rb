def get_code ()
  $m += 1
  ($m = 0; $n += 1) if $m == 2**$n - 1
  "%0#{$n}d" % $m.to_s(2)
end

IO.foreach(ARGV[0]){|line|
  $n, $m = 0, -1
  chars, code = line.slice!(0...line.index(/[01]/)), line
  dict, out = {}, ""
  chars.each_char{|c| dict[get_code()] = c}

  i = 0
  while i < code.size
    l = code[i, 3].to_i(2); i += 3
    while true
      chunk = code[i, l]; i += l
      if dict[chunk] then out << dict[chunk] else break end
    end
  end
  puts out
}
