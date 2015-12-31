require 'enumerator'

message = "012222 1114142503 0313012513 03141418192102 0113 2419182119021713 06131715070119"
alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
decode = alphabet.chars.collect{|c| alphabet["BHISOECRTMGWYVALUZDNFJKPQX".index(c)]}

puts message.split.collect{|word|
  word.chars.each_slice(2).map{|c, d|
    decode[(c+d).to_i]
  }.join
}.join(" ")
