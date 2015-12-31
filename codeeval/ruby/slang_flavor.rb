# SLANG FLAVOR
#
# Append slang to every second sentence, cycling through the given slangs.
#
# NOTE: This problem is actually kind of special within CodeEval, as cycling
# through the slangs and the "every other sentence" condition carry over from
# line to line. Usually each line's solution is self-contained. We therefore
# need to make the slang and replace counter global.

slang = [
  ", yeah!",
  ", this is crazy, I tell ya.",
  ", can U believe this?",
  ", eh?",
  ", aw yea.",
  ", yo.",
  "? No way!",
  ". Awesome!",
].cycle

replace = false

IO.foreach(ARGV[0]) do |line|
  # Start appending slang to the second sentence
  puts line.strip.chars.map{|c|
    # Punctuation marks mark the end of a sentence
    if [".", "!", "?"].include?(c)
      replace = !replace
      # Check !replace, as we just inverted it, but want the old value
      next slang.next if !replace
    end
    c
  }.join
end
