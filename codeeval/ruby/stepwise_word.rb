# STEPWISE WORD
#
# Print the longest word of the row in a special manner:
# foobar => f *o **o ***b ****a *****r

IO.foreach(ARGV[0]) do |line|
  words = line.split

  # Take the first word of maximum length.
  max_length = words.map(&:size).max
  longest_word = words.select{|w| w.size == max_length}.first

  output = longest_word.chars.each_with_index.map do |c, i|
    # Use string formatting and interpolation to get the correct padding. It's
    # hard-coded to spaces, so we have to change those to asterisks.
    ("%#{i+1}s" % [c]).gsub(/ /, "*")
  end.join(" ")

  puts output
end
