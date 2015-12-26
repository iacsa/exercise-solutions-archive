require 'enumerator'
IO.foreach(ARGV[0]){|line|
  str, *patterns = line.chomp.split(/[,;]/)
  res, replaced = str.chars.to_a, Array.new(str.size, false)
  patterns.each_slice(2){|pat, rep|
    str.chars.each_cons(pat.size).each_with_index{|sub, i|
      if sub.join == pat and replaced[i, pat.size].none?
        (0...pat.size).each{|j| replaced[i+j] = true; res[i+j] = ""}
        res[i] = rep
      end
    }
  }
  puts res.join
}
