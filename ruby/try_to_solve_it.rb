# TRY TO SOLVE IT
#
# Decode the messages

code = ["abcdefghijklm", "uvwxyznopqrst"]
FROM = code[0] + code[1]
TO = code[1] + code[0]

IO.foreach(ARGV[0]) do |line|
  print line.tr(FROM, TO)
end
