# CLEAN UP THE WORDS
#
# Remove any non-alphabetic characters from the input and normalize remaining
# text.

IO.foreach(ARGV[0]) do |line|
  puts line.downcase.gsub(/[^[a-z]]+/, " ").strip
end
