# CHARDONNAY OR CABERNET
#
# Find all strings that contains the given letters

IO.foreach(ARGV[0]) do |line|
  names, letters = line.split("|")
  names, letters = names.split, letters.strip
  wines = names.select do |name|
    letters.chars.all? do |c|
      letters.count(c) <= name.count(c)
    end
  end
  puts (wines.size > 0 ? wines.join(" ") : "False")
end
